*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Go to homepage
    click link    Home

Go to cart
    click link    Cart

Add book to cart
    click button    id=book-id-1

Remove book from cart
    click button    id=book-id-15