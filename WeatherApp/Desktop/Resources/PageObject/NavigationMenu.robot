*** Settings ***
Library  SeleniumLibrary
Resource  ../PageObject/UserNavigationTab.robot

*** Variables ***
${NavigationMenu_Username_Locator}                //div[@class='inner-user-container']
${NavigationMenu_UserDropdown_Locator}            //ul[@class='dropdown-menu dropdown-visible']
${NavigationMenu_UserDropdown_MyProfile_Locator}  //ul[@class='dropdown-menu dropdown-visible']//a[text()='My profile']


*** Keywords ***
Click On The Username In Navigation Menu
    [Documentation]  User clicks on the Username tab in the top navigation menu
    Wait Until Element Is Visible    ${NavigationMenu_Username_Locator}
    Click Element    ${NavigationMenu_Username_Locator}
    Wait Until Element Is Visible    ${NavigationMenu_UserDropdown_Locator}

Select "My Profile" From The Dropdown List In Navigation Menu
    [Documentation]  User has previously clicked on the Username tab and now selects "My Profile" option from the dropdown
    Click On The Username In Navigation Menu
    Wait Until Element Is Visible    ${NavigationMenu_UserDropdown_MyProfile_Locator}
    Click Element    ${NavigationMenu_UserDropdown_MyProfile_Locator}
    Wait Until Element Is Visible    ${UserNavigationTab_MyProfileTab_Locator}

Verify New User Name Is Displayed In The Navigation Menu
    [Documentation]  Check that new username is displayed in the top navigation menu
    [Arguments]  ${NewUsername}
    Wait Until Element Is Visible    ${NavigationMenu_Username_Locator}
    Location Should Be    ${URL}
    Element Text Should Be    ${NavigationMenu_Username_Locator}  ${NewUsername}