*** Settings ***
Documentation    Test Template
Library    SeleniumLibrary
Resource    ../resources/page_object/keywords/resourceTestTemplate1.resource
Test Template    Verify the error message with invalid login
Test Teardown     Close Browser

*** Test Cases ***
Invalid User and Password    admin    admin123
Invalid User    admin    learning
Invalid Password    rahulshettyacademy    admihn123
