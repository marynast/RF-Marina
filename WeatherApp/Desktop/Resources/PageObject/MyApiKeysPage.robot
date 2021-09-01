*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Api_Key_Locator}  //table[@class='material_table api-keys']//pre

*** Keywords ***
Get API Key Text
    ${apiKey}=  Get Text    ${Api_Key_Locator}
    [Return]  ${apiKey}