*** Settings ***
Documentation    To validate the Login Page
Library    SeleniumLibrary
Test Teardown     Close Browser
#Resource

*** Variables ***
${URL}        https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}    Firefox
${Error_message_Login}    Incorrect username/password.

*** Test Cases ***
Validate Unsuccessful login  # Test Case Name
    [Tags]    smokeTest    invalidLogin
    Open Browser with Login portal
    Fill the Login Form
    Wait until it checks and display error message
    Verify error message is correct

Login Button Should Be Visible
    [Tags]    smokeTest
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //div[@id='login-column']    10 seconds
    Page Should Contain Element    //div[@id='login-column']

*** Keywords ***
Open Browser with Login portal
    Create Webdriver    ${BROWSER}
    Go To    ${URL}
    Maximize Browser Window

Fill the Login Form
    Input Text    //input[@id='username']    antonio@automation.com
    Input Password    id:password    demo1234
    Click Button    id:signInBtn
    
Wait until it checks and display error message
    Wait Until Element Is Visible    css:.alert.alert-danger.col-md-12    10 seconds
    
Verify error message is correct
    ${textMessage}     Get Text    css:.alert.alert-danger
    Should Be Equal As Strings    ${textMessage}    ${Error_message_Login}
    Element Text Should Be        css:.alert.alert-danger    ${Error_message_Login}