*** Settings ***
Resource  Resource.robot

*** Variables ***

*** Keywords ***
Get Api Key
    UserSettingsStep.User Goes to Profile Settings    My API keys
    ${apiKey}=  MyApiKeysPage.Get API Key Text
    [Return]  ${apiKey}