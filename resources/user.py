from flask import request, render_template, session, redirect, url_for, flash
from flask.views import MethodView
from flask_smorest import Blueprint
from models import UserModel
from sqlalchemy.exc import SQLAlchemyError
from db import db

blp = Blueprint("users", __name__, description="Operations on users")


@blp.route("/register")
class CreateUser(MethodView):
    def get(self):
        return render_template("register.html")

    def post(self):
        password = request.form["password"]
        repeated_password = request.form["repeated_password"]
        user_by_login = UserModel.query.filter_by(login=request.form["login"]).first()
        if user_by_login:
            flash(f"Login already taken")
            return redirect(url_for("users.CreateUser"))
        elif password != repeated_password:
            flash(f"Passwords doesn't match")
            return render_template("register.html")
        elif len(password) < 8:
            flash(f"Password must contain at least 8 characters")
            return redirect(url_for("users.CreateUser"))
        else:
            try:
                user = UserModel(login=login, password=password, role="user")
                db.session.add(user)
                db.session.commit()
                return render_template("login.html")
            except SQLAlchemyError:
                flash("An error occurred while inserting a user, try again", "info")
                return render_template("register.html")


@blp.route("/user/panel")
class UsersOperations(MethodView):
    def get(self):
        users = UserModel.query.all()
        return render_template("users_panel.html", users=users)

    def post(self):
        user_id = request.form["id"]
        role = request.form["role"]
        user = UserModel.query.filter_by(id=user_id).first()
        user.role = role
        db.session.commit()
        flash("Role has been changed")
        return redirect(url_for("users.UsersOperations"))


@blp.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        login = request.form["login"]
        pwd = request.form["password"]
        user = UserModel.query.filter_by(login=login).first()
        if user:
            if user.login == login and user.password == pwd:
                session["user"] = user.login
                session["user_id"] = user.id
                session["role"] = user.role
                flash("Successful logged in!", "info")
                return render_template("user.html", user=login)
            else:
                flash("Login or password incorrect try again", "info")
                return render_template("login.html")
    else:
        if "user" in session:
            flash(f"Already logged in")
            login = session["user"]
            return render_template("user.html", user=login)
        return render_template("login.html")


@blp.route("/logout")
def logout():
    if "user" in session:
        user = session["user"]
        session.pop("user", None)
        flash(f"You have been logged out, {user}", "info")
    return render_template("index.html")


@blp.route("/user/delete")
class DeleteUser(MethodView):
    def post(self):
        user_id = request.form["id"]
        user = UserModel.query.filter_by(id=user_id).delete()
        db.session.commit()
        flash(f"User has been deleted")
        return redirect(url_for("users.UsersOperations"))
