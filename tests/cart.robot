*** Settings ***
Library    SeleniumLibrary

Resource    ../tests-resources/utils.robot
Resource    ../tests-resources/cart.robot

Test Setup    Begin Web Test
Test Teardown    End test

*** Variables ***

*** Test Cases ***
Should be able to add book into the cart
    [Tags]    3001      Smoke       Cart
    Login to admin account
    Go to homepage
    Add book to cart
    page should contain    Successful added to your cart

Should be able to remove book from the cart
    [Tags]      3002        Smoke       Cart
    Login to admin account
    Go to homepage
    Go to cart
    Remove book from cart
    page should contain    Book has been removed from your cart
