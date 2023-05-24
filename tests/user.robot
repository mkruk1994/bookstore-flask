*** Settings ***
#Keywords definition are in test-resources user.robot
Resource    ../tests-resources/user.robot
Resource    ../tests-resources/utils.robot

Test Setup    Begin web test
Test Teardown    End test


*** Test Cases ***
Should be able to login with valid user account
    [Tags]    1001      Smoke       Login
    Go to login page
    Use valid account data
    page should contain         Successful logged in!

Should not be able to login with invalid user account
    [Tags]    1002      Smoke       Login
    Go to login page
    Use invalid account data
    page should contain    Login or password incorrect try again

Should be able to create new account
    [Tags]    1003      Smoke       Registration
    Go to registration page
    Use valid registration data
    page should contain    Successful created an account

Should not be able to create new account - login already taken
    [Tags]    1004      Smoke       Registration
    Go to registration page
    Use valid registration data
    page should contain    Login already taken

Should not be able to create new account - passwords does not match
    [Tags]    1005      Smoke       Registration
    Go to registration page
    Use invalid registration data - different passwords
    page should contain    Passwords doesn't match

Should not be able to create new account - passwords contains seven characters
   [Tags]    1006       Smoke       Registration
   Go to registration page
   Use invalid registration data - passwords contains seven characters
   page should contain    Password must contain at least 8 characters

Should be able to change user role to admin
    [Tags]    1007      Smoke       Administration
    Go to login page
    Use valid account data
    Go to users panel
    Change user role to admin
    page should contain    Role has been changed

Should be able to delete user account
    [Tags]    1008      Smoke       Administration
    Go to login page
    Use valid account data
    Go to users panel
    Delete user account
    page should contain    User has been deleted

*** Keywords ***

#Run single test case by tag
#robot -d tests-results -i 1008 tests
#Run the script
#robot -d tests-results  tests/user.robot
#Run all scripts by directory
#robot -d tests-results -N "Full Regression" tests
*** Variables ***