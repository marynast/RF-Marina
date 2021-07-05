*** Settings ***
Library  SeleniumLibrary
Resource  WeatherApp/Desktop/Desktop_Imports.robot

*** Variables ***
${NavigationMenu_Username_Locator}                 //div[@class='inner-user-container']
${NavigationMenu_UserDropdown_Locator}             //ul[@class='dropdown-menu dropdown-visible']
${NavigationMenu_UserDropdown_Logout_Locator}      //ul[@class='dropdown-menu dropdown-visible']//a[text()='Logout']
${UserDropdownIsVisible}


*** Keywords ***
Click Option In User Dropdown List
    [Documentation]  User has clicked on the Username tab and now selects an option from the dropdown
    [Arguments]  ${user_dropdown_option}
    Open User Dropdown List In Navigation Menu
    ${option_locator}    Generate User Dropdown Option Locator    ${user_dropdown_option}
    Wait Until Element Is Visible    ${option_locator}
    Click Element    ${option_locator}
    Wait Until Element Is Not Visible    ${NavigationMenu_UserDropdown_Locator}

Generate User Dropdown Option Locator
    [Documentation]  Gets the locator of the specified user dropdown option
    [Arguments]  ${user_dropdown_option}
    ${dropdown_option_element_locator}    Set Variable    //ul[@class='dropdown-menu dropdown-visible']//a[text()='${user_dropdown_option}']
    [Return]  ${dropdown_option_element_locator}


Open User Dropdown List In Navigation Menu
    [Documentation]  User clicks on the Username tab in the top navigation menu
    ${user_dropdown_is_visible}=  Run Keyword And Return Status   Element Should Not Be Visible   ${NavigationMenu_UserDropdown_Locator}
    IF    "${user_dropdown_is_visible}" == "${True}"
        Wait Until Element Is Visible    ${NavigationMenu_Username_Locator}
        Click Element    ${NavigationMenu_Username_Locator}
        Wait Until Element Is Visible    ${NavigationMenu_UserDropdown_Locator}
    END


Verify User Name Is Displayed In The Navigation Menu
    [Documentation]  Check that username is displayed in the top navigation menu
    [Arguments]  ${username}
    Wait Until Element Is Visible    ${NavigationMenu_Username_Locator}
    Location Should Be    ${URL}
    Element Text Should Be    ${NavigationMenu_Username_Locator}  ${username}

