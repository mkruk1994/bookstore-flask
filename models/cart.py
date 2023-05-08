from db import db


class CartModel(db.Model):
    __tablename__ = "cart"

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), unique=False, nullable=False)
    author = db.Column(db.String(80), unique=False, nullable=False)
    genre = db.Column(db.String(80), unique=False, nullable=False)
    price = db.Column(db.Float(precision=2), unique=False, nullable=False)
    cover = db.Column(db.String(250), unique=False, nullable=False)
    description = db.Column(db.String(1000), unique=False, nullable=False)

    book_id = db.Column(db.Integer, db.ForeignKey("books.id"), nullable=False)
    book = db.relationship("BookModel", back_populates="cart")
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"), unique=False, nullable=False)
    user = db.relationship("UserModel", back_populates="cart")
