*** Settings ***
#Keywords definition in user.robot
Resource    ../tests-resources/user.robot

#Run single test case
#robot -d results -t "name of test case" tests
#Run the script
#robot -d tests-results  tests/user.robot
#Run all scripts by directory
#robot -d results -N "Full Regression" tests
*** Variables ***


*** Test Cases ***
Should be able to login with valid user account
    [Tags]    1001      Smoke       Login
    Begin web test
    Go to login page
    Use valid account data
    page should contain         Successful logged in!
    End test
Should not be able to login with invalid user account
    [Tags]    1002      Smoke       Login
    Begin web test
    Go to login page
    Use invalid account data
    page should contain    Login or password incorrect try again
    End test


*** Keywords ***