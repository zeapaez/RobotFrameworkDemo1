*** Settings ***
Documentation    To Validate the Login Page
Library    SeleniumLibrary
Library    ../lib/ShopLibrary1.py
Test Setup    Open Browser on Login portal
Test Teardown    Close Browser
Resource    ../resources/page_object/keywords/keyword1.resource

*** Variables ***
@{list_of_Products}    iphone X    Samsung Note 8    Nokia Edge    Blackberry
   
*** Test Cases ***
#Validate Unsuccessful login
#    Fill the Login Form    ${InvalidUserName}    ${InvalidPassword}
#    Wait until Element is Visible in the page    ${ErrorMessageElement}
#    Verify error message is correct

Validate Successful login and Select an Item
    [Tags]    smokeTest    shop
    Fill the Login Form    ${ValidUserName}    ${ValidPassword}
    Wait until Element is Visible in the page    ${HomePageElement}
    Verify the name of the Page is correct
    Verify Card Titles in the Shop Page
    #Select the card    Nokia Edge
    Hello World
    Add Items To Cart And Checkout    ${list_of_Products}
    Sleep    5 seconds

#Select the Form and navigate
#    Login and Select User option
#    Sleep    5 seconds