from db import db


class BookModel(db.Model):
    __tablename__ = "books"

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), unique=False, nullable=False)
    author = db.Column(db.String(80), unique=False, nullable=False)
    genre = db.Column(db.String(80), unique=False, nullable=False)
    price = db.Column(db.Float(precision=2), unique=False, nullable=False)
    cover = db.Column(db.String(250), unique=False, nullable=False)
    description = db.Column(db.String(1000), unique=False, nullable=False)

    cart = db.relationship("CartModel", back_populates="book", lazy="dynamic", cascade="all, delete")
