# Bookstore application 
Project of the online bookstore which allows to create entries of books with:
- Cover photo,
- Title,
- Author name and last name,
- Description,
- Price. 

An application is based on user role system whose have different permissions. By default when new user has registered this account gets granted permissions to add books to cart and remove them from there. There is another type of permissions for administration where it is possible to:
- Create new book,
- Update, delete books,
- Change account role from normal user to admin,
- Delete accounts.

## Project based on:
- Python with Flask,
- Database with SQLAlchemy,
- HTML with Jinja2,
- CSS with Bootstrap,
- Tests with Robot Framework.

## Account examples
With user permissions (without spaces):
- login: user
- password: user

With administrator permissions (without spaces):
- login: admin
- password: admin

## Installation
Use the package manager pip to install libraries needed to run the project.
````bash
pip install -r requirements.txt
````
## Running application
To run application use
````bash
flask run
````
By default application should run on (http://127.0.0.1:5000)

