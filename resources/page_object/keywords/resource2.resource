*** Settings ***
Documentation     Keywords and variables for the Test Cases
...
...        This is a commment line 1
...        And this is the continue line 2
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String

*** Variables ***
#Main Variables
${URL}        https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}    Chrome
${ValidUserName}     rahulshettyacademy
${ValidPassword}    learning
#Web Elements
${BannerLink}    css:.blinkingText
${NavigationMenu}    css:.nav-outer.clearfix
${TitleHomePageElement}    css:.inner-box h1
${EmailLabelMessage}    css:.im-para.red a
${TextLabelMessage}    css:p.im-para.red
#Values to Verify
${NameHomePage}    DOCUMENTS REQUEST
${ExpectedEmail}    mentor@rahulshettyacademy.com
${MainPageTitle}    LoginPage Practise | Rahul Shetty Academy

*** Keywords ***
Click on the Promotion Banner
    Wait Until Element Is Visible    ${BannerLink}
    Click Element    ${BannerLink}

Verify the New Window is Switched
    Switch Window    NEW
    Wait Until Element Is Visible    ${NavigationMenu}
    Element Text Should Be    ${TitleHomePageElement}    ${NameHomePage}
    
Catch the Email in the Message in the Home Page 
    Wait Until Element Is Visible    ${EmailLabelMessage}
    ${textMessage}     Get Text    ${EmailLabelMessage}
    Should Be Equal As Strings    ${textMessage}    ${ExpectedEmail}
    Element Text Should Be        ${EmailLabelMessage}    ${ExpectedEmail}
  
Catch the Email by Split Method
    ${textMessage}     Get Text    ${TextLabelMessage}
    Log    ${textMessage}

    @{SplitValue}    Split String    ${textMessage}    at
    ${text_splitted}    Get From List    ${SplitValue}    1
    Log    ${text_splitted}

    @{SplitValue2}    Split String    ${text_splitted}
    ${text_splitted2}    Get From List    ${SplitValue2}    0
    Log    ${text_splitted2}
    Log    ${ExpectedEmail}
    Should Be Equal As Strings    ${ExpectedEmail}    ${text_splitted2}
    
Go to Main Window in the Browser
    Switch Window    MAIN
    Title Should Be    ${MainPageTitle}