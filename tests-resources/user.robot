*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADMIN_ACCOUNT_LOGIN}      admin
${ADMIN_ACCOUNT_PASSWORD}   admin

*** Keywords ***
Go to login page
    click link    Login
    wait until page contains    Password

Go to registration page
    click link    Sign up
    wait until page contains    Password (at least 8 characters)

Go to users panel
    click link  Users panel
    wait until page contains    Login

Use valid account data
    input text    name=login    ${ADMIN_ACCOUNT_LOGIN}
    input text    name=password     ${ADMIN_ACCOUNT_PASSWORD}
    click button    Login

Use invalid account data
    input text    name=login    admin2
    input text    name=password     admin2
    click button    Login

Use valid registration data
    ${user_data} =  create list     user1234   user1234    user1234
    input text    name=login    ${user_data}[0]
    input text    name=password     ${user_data}[1]
    input text    name=repeated_password    ${user_data}[2]
    click button    Create new account

Use invalid registration data - different passwords
    ${user_data} =  create list    user12345    user12345   user12342
    input text    name=login    ${user_data}[0]
    input text    name=password     ${user_data}[1]
    input text    name=repeated_password    ${user_data}[2]
    click button    Create new account

Use invalid registration data - passwords contains seven characters
    ${user_data} =  create list    user12345   user123     user123
    input text    name=login    ${user_data}[0]
    input text    name=password     ${user_data}[1]
    input text    name=repeated_password    ${user_data}[2]
    click button    Create new account

Change user role to admin
    select from list by index   id=user-id-4    2
    click button    id=role-id-4

Delete user account
    click button    id=btn-id-4
