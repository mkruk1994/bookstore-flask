from flask import request, render_template, flash, redirect, url_for
from flask.views import MethodView
from flask_smorest import Blueprint
from models import BookModel, CartModel
from sqlalchemy.exc import SQLAlchemyError
from db import db

blp = Blueprint("books", __name__, description="Operations on books")


@blp.route("/book/create")
class BookCreate(MethodView):
    def get(self):
        return render_template("create_book.html")

    def post(self):
        if len(request.form["title"]) == 0 or len(request.form["author"]) == 0 or len(request.form["genre"]) == 0\
                or len(request.form["cover"]) == 0 or len(request.form["description"]) == 0:
            flash(f"All fields have to be filled up")
            return render_template("create_book.html")
        try:
            result = request.form
            book = BookModel(**result)
            db.session.add(book)
            db.session.commit()
            flash(f"Book successful created")
            return render_template("create_book.html")
        except SQLAlchemyError:
            flash("Price has to be a number")
        return render_template("create_book.html")


@blp.route("/")
class HomePage(MethodView):
    def get(self):
        books = BookModel.query.all()
        return render_template("index.html", books=books)


@blp.route("/books/operations")
class BooksOperations(MethodView):
    def get(self):
        books = BookModel.query.all()
        return render_template("books_operations.html", books=books)

    def post(self):
        id = request.form["id"]
        book = BookModel.query.filter_by(id=id).first()
        return render_template("update_book.html", book=book)


@blp.route("/book/update")
class BookUpdate(MethodView):
    def post(self):
        id = request.form["id"]
        title = request.form["title"]
        author = request.form["author"]
        genre = request.form["genre"]
        price = request.form["price"]
        cover = request.form["cover"]
        description = request.form["description"]
        if len(title) == 0 or len(author) == 0 or len(genre) == 0:
            flash(f"All fields have to be filled up")
            return render_template("books_operations.html")
        else:
            book = BookModel.query.filter_by(id=id).first()
            book.title = title
            book.author = author
            book.genre = genre
            book.cover = cover
            book.description = description
            try:
                book.price = price
                db.session.commit()
                flash(f"Book update successful")
            except SQLAlchemyError:
                flash("Price has to be a number")
            return redirect(url_for("books.BooksOperations"))


@blp.route("/book/delete")
class BookDelete(MethodView):
    def post(self):
        id = request.form["id"]
        book = BookModel.query.filter_by(id=id).delete()
        cart = CartModel.query.filter_by(book_id=id).delete()
        db.session.commit()
        flash(f"Book has been deleted")
        return redirect(url_for("books.BooksOperations"))
