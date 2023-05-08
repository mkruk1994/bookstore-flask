from db import db


class UserModel(db.Model):
    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    login = db.Column(db.String(30), unique=True, nullable=False)
    password = db.Column(db.String(30), unique=False, nullable=False)
    role = db.Column(db.String(30), unique=False, nullable=False)
    cart = db.relationship("CartModel", back_populates="user", lazy="dynamic")
