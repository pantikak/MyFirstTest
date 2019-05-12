*** Settings ***
Test Teardown     Close Browser
Library           Selenium2Library

*** Variables ***
${url_facebook}    https://www.facebook.com
${title_facebook}    Facebook - เข้าสู่ระบบหรือสมัครใช้งาน
${txt_email}      //*[@id="email"]
${txt_pass}       //*[@id="pass"]
${btn_login}      //*[@class="uiButton uiButtonConfirm"]
${username_success}    namano050518@gmail.com
${pass_success}    Namano@050518
${username_fail}    fail@gmail.com
${pass_fail}      failNamano
${login_fail}     //*[@role="alert"]
${login_pass}     //*[@id="pagelet_composer"]

*** Test Cases ***
Log in valid email and pass
    [Tags]    success-yeah
    Open Browser    about:blank    chrome
    Go To    ${url_facebook}
    Verify Facebook Page    ${title_facebook}
    Input Username and Password    ${txt_email}    ${txt_pass}    ${username_success}    ${pass_success}
    Click Button Login    ${btn_login}
    Verify Login Success    ${login_pass}

Log in invalid email
    [Tags]    failed-ooh
    Open Browser    about:blank    chrome
    Go To    ${url_facebook}
    Verify Facebook Page    ${title_facebook}
    Input Username and Password    ${txt_email}    ${txt_pass}    ${username_fail}    ${pass_fail}
    Click Button Login    ${btn_login}
    Verify Login Success    ${login_fail}

Log in invalid password
    [Tags]    failed-ooh
    Open Browser    about:blank    chrome
    Go To    ${url_facebook}
    Verify Facebook Page    ${title_facebook}
    Input Username and Password    ${txt_email}    ${txt_pass}    ${username_success}    ${pass_fail}
    Click Button Login    ${btn_login}
    Verify Login Success    ${login_fail}

*** Keywords ***
Verify Facebook Page
    [Arguments]    ${title}
    Title Should Be    ${title}

Input Username and Password
    [Arguments]    ${xpath_user}    ${xpath_pass}    ${username}    ${password}
    Element Should Be Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text    ${xpath_user}    ${username}
    Input Text    ${xpath_pass}    ${password}

Click Button Login
    [Arguments]    ${btn}
    Element Should Be Visible    ${btn}
    Click Element    ${btn}

Verify Login Fail
    [Arguments]    ${xpath}
    Element Should Be Visible    ${xpath}

Verify Login Success
    [Arguments]    ${xpath}
    Element Should Be Visible    ${xpath}
