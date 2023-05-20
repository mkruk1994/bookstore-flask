from flask import request, render_template, session, flash, redirect, url_for
from flask.views import MethodView
from flask_smorest import Blueprint
from models import BookModel, CartModel

from db import db

blp = Blueprint("cart", __name__, description="Operations on cart")


@blp.route("/cart")
class Cart(MethodView):
    def get(self):
        if "user" in session:
            user_id = session["user_id"]
            cart = CartModel.query.filter_by(user_id=user_id).all()
            amount = 0
            for book in cart:
                amount += book.price
        return render_template("cart.html", cart=cart, sum=amount)

    def post(self):
        if "user" in session:
            user_id = session["user_id"]
            book_id = request.form["id"]
            book = BookModel.query.filter_by(id=book_id).first()
            cart = CartModel(book_id=book_id, title=book.title, author=book.author, genre=book.genre, price=book.price,
                             user_id=user_id, cover=book.cover, description=book.description)
            db.session.add(cart)
            db.session.commit()
            flash(f"Successful added to your cart")
            return redirect(url_for("books.HomePage"))
        else:
            return redirect(url_for("users.Login"))


@blp.route("/cart/delete")
class BookDelete(MethodView):
    def post(self):
        id = request.form["id"]
        cart_item = CartModel.query.filter_by(id=id).delete()
        db.session.commit()
        flash("Book has been removed from your cart")
        return redirect(url_for("cart.Cart"))
