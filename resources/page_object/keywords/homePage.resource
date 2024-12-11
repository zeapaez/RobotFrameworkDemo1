*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Variables    ../locators/homePage.py

*** Variables ***
${PageName}    ProtoCommerce Home

*** Keywords ***
Wait until Home Page is Visible
    Wait Until Element Is Visible    ${CarouselElement}    10 seconds

Verify the name of the Page is correct
    Element Text Should Be        ${LandingPageLabel}   ${PageName}

Verify Card Titles in the Shop Page
    @{ExpectedListCard}    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${WebElements}    Get Webelements    ${CardNameItems}
    @{ActualList}    Create List
    FOR     ${var}     IN     @{WebElements}
        Log     ${var.text}
        Append To List    ${ActualList}    ${var.text}
    END
    Lists Should Be Equal    ${ExpectedListCard}    ${ActualList}

Select the card
    [Arguments]    ${CardName}
    Click Button    //*[text() = '${CardName}']//ancestor::div[@class='card h-100']//button[@class='btn btn-info']
    
Click on Checkout Button
    Run Keyword And Ignore Error    Scroll Element Into View    ${CheckoutButton}
    Wait Until Element Is Enabled    ${CheckoutButton}
    Click Link    ${CheckoutButton}