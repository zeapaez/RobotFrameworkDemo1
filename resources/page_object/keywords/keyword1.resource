*** Settings ***
Documentation     Keywords and variables for the Test Cases
...
...        This is a commment line 1
...        And this is the continue line 2
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${URL}        https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}    Chrome
${Error_message_Login}    Incorrect username/password.
${InvalidUserName}     antonio@automation.com
${InvalidPassword}    demo1234
${ValidUserName}     rahulshettyacademy
${ValidPassword}    learning
${PageName}    ProtoCommerce Home
${ErrorMessageElement}    css:.alert.alert-danger.col-md-12
${HomePageElement}        id:carouselExampleIndicators
${CheckoutButton}    //*[@class='nav-item active']

*** Keywords ***
Open Browser on Login portal
   Open Browser    ${URL}    ${BROWSER}
   Maximize Browser Window

Fill the Login Form
    [arguments]    ${username}    ${password}
    Input Text    //input[@id='username']     ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

Wait until it checks and display error message
    Wait Until Element Is Visible    css:.alert.alert-danger.col-md-12

Verify error message is correct
    ${textMessage}     Get Text    css:.alert.alert-danger
    Should Be Equal As Strings    ${textMessage}    ${Error_message_Login}
    Element Text Should Be        css:.alert.alert-danger    ${Error_message_Login}

Wait until it checks and display Homepage
    Wait Until Element Is Visible    id:carouselExampleIndicators    10 seconds

Wait until Element is Visible in the page
    [Arguments]    ${WebElement}
    Wait Until Element Is Visible    ${WebElement}    10 seconds

Verify the name of the Page is correct
    Element Text Should Be        css:app-root .navbar-fixed-top .navbar-brand    ${PageName}

Verify Card Titles in the Shop Page
    @{ExpectedListCard}    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${WebElements}    Get Webelements    css:.card-body .card-title a
    @{ActualList}    Create List
    FOR     ${var}     IN     @{WebElements}
        Log     ${var.text}
        Append To List    ${ActualList}    ${var.text}
    END
    Lists Should Be Equal    ${ExpectedListCard}    ${ActualList}

Select the card
    [Arguments]    ${CardName}
    Click Button    //*[text() = '${CardName}']//ancestor::div[@class='card h-100']//button[@class='btn btn-info']

Select the card2
    [Arguments]    ${CardName}
    Log    ${CardName}
    ${WebElements}    Get Webelements    css:.card-body .card-title a
    ${index}    Set Variable    1
    FOR     ${var}     IN     @{WebElements}
        LOG     ${var.text}
        Exit For Loop If    '${CardName}' == '${var.text}'
        ${index}=    evaluate    ${index} +1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Click on
    [Arguments]    ${ButtonName}
    Scroll Element Into View    ${ButtonName}
    Wait Until Element Is Enabled    ${ButtonName}
    Click Button    ${ButtonName}

Login and Select User option
    Input Text    //input[@id='username']     ${ValidUserName}
    Input Password    id:password    ${ValidPassword}
    #Select Radio Button    radio    user
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    id:okayBtn
    Wait Until Element Is Enabled    id:okayBtn
    Click Button    id:okayBtn
    Select From List By Value    css:select.form-control    consult
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms
    #Checkbox Should Not Be Selected    id:terms