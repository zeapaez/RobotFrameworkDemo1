*** Settings ***
Library    SeleniumLibrary
Variables    ../locators/checkout.py

*** Variables ***
#//a[contains(text(),'India')]
${Location}    Ind
${ExpectedAlert}    Thank you! Your order will be delivered in next few weeks :-).


*** Keywords ***
Checkout and Confirm the Country
    [Arguments]    ${Country}
    Wait Until Element Is Visible    ${CheckoutButtonCart}
    Wait Until Element Is Enabled     ${CheckoutButtonCart}
    Click Button    ${CheckoutButtonCart}
    Wait Until Element Is Visible    ${LocationField}
    Input Text    ${LocationField}    ${Country}
    Wait Until Element Is Visible    ${SuggestionsResults}    10 seconds
    Click Element    //a[contains(text(),'${Country}')]
    Click Element    ${IAgreeCheckbox}
    Click Element    ${PurchaseButton}
    Wait Until Element Is Visible    ${AlertSuccess}
    Element Should Contain    ${AlertSuccess}    ${ExpectedAlert}
