*** Settings ***
Documentation  A test suite to verify user settings
Resource  ../Resources/General.robot
Resource  ../Resources/PageObject/SignInPage.robot
Resource  ../Resources/PageObject/NavigationMenu.robot
Resource  ../Resources/PageObject/UserProfilePage.robot
Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Variables ***
${NewUsername}  MarinaNew

*** Test Cases ***
User Changes Name In User Profile
    [Documentation]  Test verifies that logged in user goes to User Profile, changes User Name and new name is displayed
    ...              in navigation menu
    [Setup]  Run Keywords
                            General.Go to Sign In Page
                            SignInPage.Input Username and Password and Click "Submit" Button    ${Valid_Username}    ${Valid_Password}
                            Verify The Login State    ${ValidCredentials_AlertText}
                            NavigationMenu.Select "My Profile" From The Dropdown List In Navigation Menu

    UserProfilePage.Type New User Name At User Profile Page  ${NewUsername}
    UserProfilePage.Click "Save" button At User Profile Page And Verify The Alert Text
    General.Go to Main Page
    NavigationMenu.Verify New User Name Is Displayed In The Navigation Menu  ${NewUsername}

*** Keywords ***

