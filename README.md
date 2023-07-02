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
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Users panel on top bar
  - Change role from user to admin for account user1234 by selecting admin in drop-down menu
  - Click Set user role button
  - Check if the page contains text ,,Role has been changed"

1008 Should be able to delete user account (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Users panel on top bar
  - Click Delete user button for account where Id = 4
  - Check if the page contains text ,,User has been deleted"

Variables for creating book test case scenarios (20XX):
  - Book title = Design patterns: elements of reusable object-oriented software
  - Author = Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides
  - Genre = Information Technology
  - Price = 25.11
  - Cover = https://m.media-amazon.com/images/I/51MAu0VlUkL._SX395_BO1,204,203,200_.jpg
  - Descritpion = Capturing a wealth of experience about the design of object-oriented software, four top-notch designers present a catalog of simple and succinct solutions to commonly occurring design problems. Previously undocumented, these 23 patterns allow designers to create more flexible, elegant, and ultimately reusable designs without having to rediscover the design solutions themselves.

2001 Should be able to create new book (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Create book on top bar
  - Use valid book data: book title, author, genre, price, cover, description
  - Click Create book button
  - Check if the page contains text ,,Book successful created"

2002 Should not be able to create new book with empty title field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Create book on top bar
  - Use valid book data: author, genre, price, cover, description
  - Click Create book button
  - Check if the page contains text ,,All fields have to be filled up"

2003 Should not be able to create new book with empty author field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Create book on top bar
  - Use valid book data: book title, genre, price, cover, description
  - Click Create book button
  - Check if the page contains text ,,All fields have to be filled up"

2004 Should not be able to create new book with empty genre field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Create book on top bar
  - Use valid book data: book title, author, price, cover, description
  - Click Create book button
  - Check if the page contains text ,,All fields have to be filled up"

2005 Should not be able to create new book with empty price field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Create book on top bar
  - Use valid book data: book title, author, genre, cover, description
  - Click Create book button
  - Check if the page contains text ,,All fields have to be filled up"

2006 Should not be able to create new book with empty cover field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Create book on top bar
  - Use valid book data: book title, author, genre, price, description
  - Click Create book button
  - Check if the page contains text ,,All fields have to be filled up"

2007 Should not be able to create new book with empty description field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Create book on top bar
  - Use valid book data: book title, author, genre, price, cover
  - Click Create book button
  - Check if the page contains text ,,All fields have to be filled up"

2008 Should be able to update book title (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Update/delete books on top bar
  - Click Update button for entry where title = Design patterns: elements of reusable object-oriented software
  - Clear the title field
  - Input new data in title field: title = Design patterns
  - Click Update book button
  - Check if the page contains text ,,Book has been successful updated"

2009 Should not be able to update book with empty title field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Update/delete books on top bar
  - Click Update button for entry where title = Design patterns: elements of reusable object-oriented software
  - Clear the title field
  - Click Update book button
  - Check if the page contains text ,,All fields have to be filled up"

2010 Should not be able to update book with empty author field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Update/delete books on top bar
  - Click Update button for entry where title = Design patterns: elements of reusable object-oriented software
  - Clear the author field
  - Click Update book button
  - Check if the page contains text ,,All fields have to be filled up"

2011 Should not be able to update book with empty genre field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Update/delete books on top bar
  - Click Update button for entry where title = Design patterns: elements of reusable object-oriented software
  - Clear the genre field
  - Click Update book button
  - Check if the page contains text ,,All fields have to be filled up"

2012 Should not be able to update book with empty price field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Update/delete books on top bar
  - Click Update button for entry where title = Design patterns: elements of reusable object-oriented software
  - Clear the price field
  - Click Update book button
  - Check if the page contains text ,,Price has to be a number"

2013 Should not be able to update book with empty cover field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Update/delete books on top bar
  - Click Update button for entry where title = Design patterns: elements of reusable object-oriented software
  - Clear the cover field
  - Click Update book button
  - Check if the page contains text ,,All fields have to be filled up"

2014 Should not be able to update book with empty description field (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Update/delete books on top bar
  - Click Update button for entry where title = Design patterns: elements of reusable object-oriented software
  - Clear the description field
  - Click Update book button
  - Check if the page contains text ,,All fields have to be filled up"

2015 Should be able to delete book (administrator permissions are required)
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Update/delete books on top bar
  - Click Delete button for entry where title = Design patterns
  - Check if the page contains text ,,Book has been deleted"

3001 Should be able to add book into the cart
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Home on top bar
  - Click Add to cart button for entry where title = Clean Code
  - Check if the page contains text ,,Successful added to your cart"

3002 Should be able to remove book from the cart
  - Open browser
  - Go to (http://127.0.0.1:5000)
  - Open login page by clicking on the Login button on top bar
  - Use valid login data for administrator account: login = admin, password = admin
  - Open Cart on top bar
  - Click Remove from cart for entry where title = Clean Code
  - Check if the page contains text ,,Book has been removed from your cart"
