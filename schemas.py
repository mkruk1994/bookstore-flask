from marshmallow import Schema, fields


class BookSchema(Schema):
    id = fields.Str(dump_only=True)
    title = fields.Str(required=True)
    author = fields.Str(required=True)
    genre = fields.Str(required=True)
    price = fields.Float(required=True)


class BookUpdateSchema(Schema):
    title = fields.Str()
    author = fields.Str()
    genre = fields.Str()
    price = fields.Float()