*** Settings ***
Library    SeleniumLibrary
Resource    ../tests-resources/book.robot
Resource    ../tests-resources/utils.robot

Test Setup      Begin Web Test
Test Teardown    End test

*** Variables ***

*** Test Cases ***
Should be able to create new book
    [Tags]    2001      Smoke       Books
    Login to admin account
    Go to create book page
    Use valid book data
    page should contain    Book successful created

Should not be able to create new book with empty title field
    [Tags]    2002      Smoke       Books
    Login to admin account
    Go to create book page
    Input book data with empty title field
    page should contain    All fields have to be filled up

Should not be able to create new book with empty author field
    [Tags]    2003      Smoke       Books Create
    Login to admin account
    Go to create book page
    Input book data with empty author field
    page should contain    All fields have to be filled up

Should not be able to create new book with empty genre field
    [Tags]    2004      Smoke       Books Create
    Login to admin account
    Go to create book page
    Input book data with empty genre field
    page should contain    All fields have to be filled up

Should not be able to create new book with empty price field
    [Tags]    2005      Smoke       Books Create
    Login to admin account
    Go to create book page
    Input book data with empty price field
    page should contain    Price has to be a number

Should not be able to create new book with empty cover field
    [Tags]      2006    Smoke       Books Create
    Login to admin account
    Go to create book page
    Input book data with empty cover field
    page should contain    All fields have to be filled up

Should not be able to create new book with empty description field
    [Tags]    2007      Smoke       Books Create
    Login to admin account
    Go to create book page
    Input book data with empty description field
    page should contain    All fields have to be filled up

Should be able to update book title
    [Tags]    2008      Smoke       Books Update
    Login to admin account
    Go to Update/delete books page
    Update book title with valid data
    page should contain    Book has been successful updated

Should not be able to update book with empty title field
    [Tags]    2009      Smoke       Books Update
    Login to admin account
    Go to Update/delete books page
    Update book title with empty title field
    page should contain    All fields have to be filled up

Should not be able to update book with empty author field
    [Tags]    2010      Smoke       Books Update
    Login to admin account
    Go to Update/delete books page
    Update book author with empty author field
    page should contain    All fields have to be filled up

Should not be able to update book with empty genre field
    [Tags]    2011      Smoke       Books Update
    Login to admin account
    Go to Update/delete books page
    Update book genre with empty genre field
    page should contain    All fields have to be filled up

Should not be able to update book with empty price field
    [Tags]    2012      Smoke       Books Update
    Login to admin account
    Go to Update/delete books page
    Update book price with empty price field
    page should contain    Price has to be a number

Should not be able to update book with empty cover field
    [Tags]    2013      Smoke       Books Update
    Login to admin account
    Go to Update/delete books page
    Update book cover with empty cover field
    page should contain    All fields have to be filled up

Should not be able to update book with empty description field
    [Tags]    2014      Smoke       Books Update
    Login to admin account
    Go to Update/delete books page
    Update book description with empty description field
    page should contain    All fields have to be filled up

Should be able to delete book
    [Tags]    2015      Smoke       Books Delete
    Login to admin account
    Go to Update/delete books page
    Delete book
    page should contain    Book has been deleted
*** Keywords ***
