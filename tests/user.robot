*** Settings ***
Library    SeleniumLibrary

#Run the script
#robot -d tests-results  tests/user.robot
*** Variables ***


*** Test Cases ***
Should be able to login with valid user account
    [Documentation]    This is some basic info about the test
    [Tags]    1001      Smoke       Login
    open browser                http://127.0.0.1:5000   chrome
    wait until page contains    Flask application
    click link                  Login
    input text                  name=login    admin
    input text                  name=password     admin
    click button                Login
    page should contain         Successful logged in!

    click link                  Users panel
    select from list by index   id=user-id-3     2
    click button                id=role-id-3
    page should contain         Role has been changed
    sleep                       3s
    close browser

*** Keywords ***
