*** Settings ***
Library  SeleniumLibrary
Resource  WeatherApp/Desktop/Desktop_Imports.robot

*** Variables ***
${NavigationMenu_Username_Locator}                 //div[@class='inner-user-container']
${NavigationMenu_UserDropdown_Locator}             //ul[@class='dropdown-menu dropdown-visible']
${NavigationMenu_UserDropdown_MyServices_Locator}  //ul[@class='dropdown-menu dropdown-visible']//a[text()='My services']
${NavigationMenu_UserDropdown_MyProfile_Locator}   //ul[@class='dropdown-menu dropdown-visible']//a[text()='My profile']
${NavigationMenu_UserDropdown_MyApiKeys_Locator}   //ul[@class='dropdown-menu dropdown-visible']//a[text()='My API keys']
${NavigationMenu_UserDropdown_MyPayments_Locator}  //ul[@class='dropdown-menu dropdown-visible']//a[text()='My payments']
${NavigationMenu_UserDropdown_Logout_Locator}      //ul[@class='dropdown-menu dropdown-visible']//a[text()='Logout']
${NavigationMenuUserDropdownOptions}               ${NavigationMenu_UserDropdown_MyServices_Locator}
...                                                ${NavigationMenu_UserDropdown_MyApiKeys_Locator}
...                                                ${NavigationMenu_UserDropdown_MyPayments_Locator}
...                                                ${NavigationMenu_UserDropdown_MyProfile_Locator}
...                                                ${NavigationMenu_UserDropdown_Logout_Locator}
${UserDropdownIsVisible}


*** Keywords ***
Click Option In User Dropdown List
    [Documentation]  User has clicked on the Username tab and now selects an option from the dropdown
    [Arguments]  ${NavigationMenuUserDropdownOptions}
    ${UserDropdownIsVisible}=  Run Keyword And Return Status   Element Should Not Be Visible   ${NavigationMenu_UserDropdown_Locator}
    Run Keyword If  ${UserDropdownIsVisible}
    ...             Open User Dropdown List In Navigation Menu
    Wait Until Element Is Visible    ${NavigationMenuUserDropdownOptions}
    Click Element    ${NavigationMenuUserDropdownOptions}
    Wait Until Element Is Not Visible    ${NavigationMenu_UserDropdown_Locator}

Open User Dropdown List In Navigation Menu
    [Documentation]  User clicks on the Username tab in the top navigation menu
    Wait Until Element Is Visible    ${NavigationMenu_Username_Locator}
    Click Element    ${NavigationMenu_Username_Locator}
    Wait Until Element Is Visible    ${NavigationMenu_UserDropdown_Locator}

Verify User Name Is Displayed In The Navigation Menu
    [Documentation]  Check that username is displayed in the top navigation menu
    [Arguments]  ${NewUsername}
    Wait Until Element Is Visible    ${NavigationMenu_Username_Locator}
    Location Should Be    ${URL}
    Element Text Should Be    ${NavigationMenu_Username_Locator}  ${NewUsername}

