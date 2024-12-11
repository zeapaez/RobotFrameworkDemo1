*** Settings ***
Library    Collections
Library    RequestsLibrary
Documentation    BaseURI : http://216.10.245.166
...             Resource: Library/Addbook.php    Method: POST
...             Input Payload : Json:
...       {
...         name:"Learn Appium Automation with Java&quot",
...         isbn:"bcd",
...         aisle:"227",
...         author:"John foe"
...       }

*** Variables ***
${BASE_URL}    http://216.10.245.166
${book_ID}

*** Test Cases ***
#Add Book into Library Database
#    &{req_body}    Create Dictionary    name=RobotFramework    isbn=MEX    aisle=2062206    author=Antonio
#    POST    ${BASE_URL}/Library/Addbook.php    json=${req_body}    expected_status=200
    
Add Book into Library Database With json response
    [Tags]    API    API_POST
    #Change the aisle value in every execution: successfully added, Book Already Exists ****
    &{req_body}    Create Dictionary    name=RobotFramework    isbn=MEX    aisle=2062211    author=Antonio
    ${response}    POST    ${BASE_URL}/Library/Addbook.php    json=${req_body}    expected_status=200
    Log    ${response.json()}
    ${book_ID}    Get From Dictionary    ${response.json()}    ID
    Set Global Variable     ${book_ID}
    ${responseMessage}    Get From Dictionary    ${response.json()}    Msg
    Log    ${book_ID}
    Log    ${responseMessage}
#    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
#    Should Be Equal As Strings    successfully added    ${responseMessage}
#    Should Be Equal As Strings    Book Already Exists    ${response.json()}[Msg]
#    Should Be Equal As Strings    Book Already Exists    ${responseMessage}
    Status Should Be    200    ${response}
    
Get Book Information into Library Database By Book ID
    [Tags]    API    API_GET
    # Comment or uncomment the get_response, book_ID comes from the previous Test Case
#    ${get_response}    GET    ${BASE_URL}/Library/GetBook.php    params=ID=MEX2062208    expected_status=200
    ${get_response}    GET    ${BASE_URL}/Library/GetBook.php    params=ID=${book_ID}    expected_status=200
    Log    ${get_response.json()}
    Log    ${get_response.json()}[0][book_name]
    Should Be Equal As Strings    RobotFramework    ${get_response.json()}[0][book_name]ñ
    Status Should Be    200    ${get_response}

Delete Book Information into Library Database By Book ID
    [Tags]    API    API_POST    API_DELETE
    #Change the ID or use book_ID variable
#    &{req_body}    Create Dictionary    ID=MEX2062206
    &{req_body}    Create Dictionary    ID=${book_ID}
    ${response}    POST    ${BASE_URL}/Library/DeleteBook.php    json=${req_body}    expected_status=200
#    ${response}    POST    ${BASE_URL}/Library/DeleteBook.php    json=${req_body}    expected_status=404
    Log    ${response.json()}
    Log    ${response.json()}[msg]
    ${MessageResponse}    Get From Dictionary    ${response.json()}    msg
    Log    ${MessageResponse}
    Should Be Equal As Strings    book is successfully deleted    ${response.json()}[msg]
#    Should Be Equal As Strings    Delete Book operation failed, looks like the book doesnt exists    ${response.json()}[msg]
    Status Should Be    200    ${response}     #200,404