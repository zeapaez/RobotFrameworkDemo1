*** Settings ***
Library    Collections

*** Test Cases ***
Play a Dictionary
    &{data}=    Create Dictionary    name=Antonio    course=robotframework    website=rahulshettyacademy.com
    Log    ${data}
    Dictionary Should Contain Key    ${data}    name     #Verify is the key exists
    Dictionary Should Contain Key    ${data}    course   #Verify is the key exists
    Dictionary Should Contain Key    ${data}    website  #Verify is the key exists
    Log    ${data}[name]    # Get the value of the Key Name
    Log    ${data}[course]    # Get the value of the Key course
    Log    ${data}[website]    # Get the value of the Key website
    ${name}    Get From Dictionary    ${data}    name
    ${course}    Get From Dictionary    ${data}    course
    ${website}    Get From Dictionary    ${data}    website
    Log    ${name}
    Log    ${course}
    Log    ${website}