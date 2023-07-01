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
- Python with Flask and Jinja2,
- Database with SQLAlchemy,
- HTML,
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

## Running all test cases
To run all test cases use
````bash
robot -d tests-results -N "Full Regression" tests
````

## Test cases scenarios
1001 Should be able to login with valid user account
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login on top bar
  - Use valid login data: login = admin, password = admin
  - Check if the page contains text ,,Successful logged in!"

1002 Should not be able to login with invalid user account
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login on top bar
  - Use invalid login data: login = admin2, password = admin2
  - Check if the page contatins text ,,Login or password incorrect try again"

1003 Should be able to create new account
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open registration page by clicking on the Sign up on top bar
  - Use valid registration data: login = user1234, password = user1234, repeated password = user1234
  - Click Create new account button
  - Check if the page contains text ,,Successful created an account"

1004 Should not be able to create new account - login already taken 
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open registration page by clicking on the Sign up on top bar
  - Use invalid registration data: login = user1234, password = user1234, repeated password = user1234
  - Click Create new account button
  - Check if the page contains text ,,Login already taken"

1005 Should not be able to create new account - passwords does not match
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open registration page by clicking on the Sign up on top bar
  - Use invalid registration data: login = user12345, password = user12345, repeated password = user12342
  - Click Create new account button
  - Check if the page contains text ,,Passwords doesn't match"

1006 Should not be able to create new account - passwords contains seven characters (password should contain at least 8 characters)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open registration page by clicking on the Sign up on top bar
  - Use invalid registration data: login = user12345, password = user123, repeated password = user123
  - Click Create new account button
  - Check if the page contians text ,,Password must contain at least 8 characters"

1007 Should be able to change user role to admin (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data: login = admin, password = admin
  - Open Users panel on top bar
  - Change role from user to admin for account user1234 by selecting admin in drop-down menu
  - Click Set user role button
  - Check if the page contains text ,,Role has been changed"

1008 Should be able to delete user account (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data: login = admin, password = admin
  - Open Users panel on top bar
  - Click Delete user button for account where Id = 4
  - Check if the page contains text ,,User has been deleted"


  

