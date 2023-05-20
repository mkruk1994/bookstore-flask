*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Begin web test
    open browser    http://127.0.0.1:5000   chrome
    maximize browser window
    wait until page contains    Flask application

End test
    close browser

Go to login page
    click link    Login
    wait until page contains    Password

Use valid account data
    input text    name=login    admin
    input text    name=password     admin
    click button    Login

Use invalid account data
    input text    name=login    admin2
    input text    name=password     admin2
    click button    Login

