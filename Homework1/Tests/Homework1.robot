*** Settings ***
Documentation   Homework June 11
Resource    ../Resources/HomeworkKeywords.robot

*** Variables ***
${NUMBER1} =  2
${NUMBER2} =  5
${EXPECTED} =  7

*** Test Cases ***
Sum of Variables
    [Tags]
    I add ${NUMBER1} and ${NUMBER2}
    The result is ${EXPECTED}

Verify the length of the list equals current time
    [Tags]
    Get hours list length
    Hours list length equals current hour