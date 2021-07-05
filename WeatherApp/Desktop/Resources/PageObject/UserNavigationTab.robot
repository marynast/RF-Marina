*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${UserNavigationTab_MyProfileTab_Locator}  //ul[@id="myTab"]//a[text()="My profile"]

*** Keywords ***
User Clicks "My Profile" In User Navigation Tab
    [Documentation]  User is logged in and selects "My profile" tab from the User navigation tab
    Wait Until Element Is Visible    ${UserNavigationTab_MyProfileTab_Locator}
    Click Element    ${UserNavigationTab_MyProfileTab_Locator}
