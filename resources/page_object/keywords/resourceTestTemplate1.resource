*** Settings ***
Documentation    This file contains the keywords of the Test Template file
Library    SeleniumLibrary

*** Variables ***
${URL}    https://rahulshettyacademy.com/loginpagePractise/    
${Browser}    Chrome
#WebElements
${UserNameField}     //input[@id='username']
${PasswordField}    id:password
${SignInButton}    id:signInBtn
${AlertErrorElement}    css:.alert.alert-danger.col-md-12
${ErrorElement}    css:.alert.alert-danger
#Values to use/validate
${Error_message_Login}    Incorrect username/password.    

*** Keywords ***
Verify the error message with invalid login
    [Arguments]    ${username}    ${password}
    Open Browser with Login portal
    Fill the Login Form    ${username}    ${password}
    Wait until it checks and display error message

Open Browser with Login portal
    Create Webdriver    ${BROWSER}
    Go To    ${URL}
    Maximize Browser Window

Fill the Login Form
    [Arguments]    ${username}    ${password}    
    Input Text    ${UserNameField}    ${username}
    Input Password    ${PasswordField}    ${password}
    Click Button    ${SignInButton}       
    
Wait until it checks and display error message
    Wait Until Element Is Visible    ${AlertErrorElement}
    ${textMessage}     Get Text    ${ErrorElement}
    Should Be Equal As Strings    ${textMessage}    ${Error_message_Login}
    Element Text Should Be        ${ErrorElement}    ${Error_message_Login}