*** Settings ***
Documentation    To Validate the Page
Library    SeleniumLibrary
Test Setup    Open Browser on Login portal
Test Teardown    Close Browser
Resource    ../resources/page_object/keywords/keyword1.resource
Resource    ../resources/page_object/keywords/resource2.resource

*** Test Cases ***
Validate Child Window Functionality
    [Tags]    openNewWindow
    Click on the Promotion Banner
    Verify the New Window is Switched
    Catch the Email in the Message in the Home Page
    Catch the Email by Split Method
    Go to Main Window in the Browser
    Sleep    2 seconds