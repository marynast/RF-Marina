*** Settings ***
Library  main.py


*** Variables ***


*** Keywords ***
I add ${NUMBER1} and ${NUMBER2}
    ${TOTALSUM}                    Evaluate  ${NUMBER1}+${NUMBER2}


The result is ${EXPECTED}
    ${TOTALSUM}                    Evaluate  ${NUMBER1}+${NUMBER2}
    Should Be Equal As Integers    ${TOTALSUM}  ${EXPECTED}


Get hours list length
    main.Get Hours List


Hours list length equals current hour
    ${hours}                        main.Get Current Hour
    ${list_length}                  main.Get Hours List

    Should Be Equal As Integers     ${list_length}    ${hours}