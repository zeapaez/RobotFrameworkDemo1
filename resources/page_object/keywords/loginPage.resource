*** Settings ***
Library    SeleniumLibrary
Variables    ../locators/login.py

*** Variables ***
${URL}        https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}    Chrome
${ValidUserName}     rahulshettyacademy
${ValidPassword}    learning
${Error_message_Login}    Incorrect username/password.

*** Keywords ***
Open the Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fill the Login Form
    Input Text    ${userNameField}     ${ValidUserName}
    Input Password    ${PasswordField}    ${ValidPassword}
    Click Button    ${sigInButton}

Fill the Login Form with Invalid credential
    Input Text    ${userNameField}     admin
    Input Password    ${PasswordField}    demo345
    Click Button    ${sigInButton}

Wait until it checks and display error message
    Wait Until Element Is Visible    ${ErrorMessageElement}    10 seconds
    
Verify error message is correct
    ${textMessage}     Get Text    ${ErrorMessageElement}
    Should Be Equal As Strings    ${textMessage}    ${Error_message_Login}
    Element Text Should Be        ${ErrorMessageElement}    ${Error_message_Login}
    
The Login Form must be visible
    Page Should Contain Element    ${LoginForm}