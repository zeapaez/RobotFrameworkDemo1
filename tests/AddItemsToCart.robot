*** Settings ***
Documentation    To validate the Login Page
Library    SeleniumLibrary
Library    ../lib/ShopLibrary1.py
Resource    ../resources/page_object/keywords/loginPage.resource
Resource    ../resources/page_object/keywords/homePage.resource
Resource    ../resources/page_object/keywords/checkout.resource
Test Teardown     Close Browser

*** Variables ***
@{list_of_Products}    iphone X    Samsung Note 8    Nokia Edge    Blackberry
@{ProductsToRemove}    Nokia Edge    Blackberry

*** Test Cases ***
Validate Unsuccessful login
    [Tags]    invalidLogin
    loginPage.Open the Login Page
    loginPage.Fill the Login Form with Invalid credential
    loginPage.Wait until it checks and display error message
    loginPage.Verify error message is correct

Login Button Should Be Visible
    loginPage.Open the Login Page
    loginPage.The Login Form must be visible

Validate Successful login and Select an Item
    [Tags]    shop
    loginPage.Open the Login Page
    loginPage.Fill the Login Form
    HomePage.Wait until Home Page is Visible
    HomePage.Verify the name of the Page is correct
    HomePage.Verify Card Titles in the Shop Page
    HomePage.Select the card    Nokia Edge

Validate Successful login and Select all Items
    [Tags]    shop
    loginPage.Open the Login Page
    loginPage.Fill the Login Form
    HomePage.Wait until Home Page is Visible
    HomePage.Verify the name of the Page is correct
    HomePage.Verify Card Titles in the Shop Page
    Add Items To Cart And Checkout    ${list_of_Products}
    
Validate Successful login and Select all Items and checkout
    [Tags]    shop    checkout    regression
    loginPage.Open the Login Page
    loginPage.Fill the Login Form
    HomePage.Wait until Home Page is Visible
    HomePage.Verify the name of the Page is correct
    HomePage.Verify Card Titles in the Shop Page
    Add Items To Cart And Checkout    ${list_of_Products}
    HomePage.Click on Checkout Button
    Remove Items From Cart    ${ProductsToRemove}
    checkout.Checkout and Confirm the Country    India