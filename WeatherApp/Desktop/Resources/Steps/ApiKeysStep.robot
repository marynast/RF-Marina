*** Settings ***
Resource  Resource.robot


*** Variables ***


*** Keywords ***
Get Api Key
    [Documentation]  User moves to Profile Settings - My API keys and gets API key
    UserSettingsStep.User Goes to Profile Settings    My API keys
    ${apiKey}=  MyApiKeysPage.Get API Key Text
    Set Test Variable    ${apiKey}