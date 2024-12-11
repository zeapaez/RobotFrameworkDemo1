*** Settings ***
Documentation    To Validate the Login Page
Library    SeleniumLibrary
Test Setup    Open Browser on Login portal
Test Teardown    Close Browser
Resource    ../resources/page_object/keywords/keyword1.resource

*** Test Cases ***
#Validate Unsuccessful login
#    Fill the Login Form    ${InvalidUserName}    ${InvalidPassword}
#    Wait until Element is Visible in the page    ${ErrorMessageElement}
#    Verify error message is correct

Validate Successful login and Select an Item
    [Tags]    smokeTest
    Fill the Login Form    ${ValidUserName}    ${ValidPassword}
    Wait until Element is Visible in the page    ${HomePageElement}
    Verify the name of the Page is correct
    Verify Card Titles in the Shop Page
    Select the card    Nokia Edge
    Sleep    5 seconds

Select the Form and navigate
    Login and Select User option
    Sleep    5 seconds