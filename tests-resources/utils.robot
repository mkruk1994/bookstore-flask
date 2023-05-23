*** Settings ***
Library    SeleniumLibrary
Resource    ../tests-resources/user.robot

*** Variables ***
${START_URL}    http://127.0.0.1:5000
${BROWSER}      chrome


*** Keywords ***
Begin web test
    open browser    ${START_URL}   ${BROWSER}
    maximize browser window
    wait until page contains    Flask application

End test
    close browser

Login to admin account
    Go to login page
    Use valid account data