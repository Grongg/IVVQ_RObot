*** Settings ***
Library   Collections
Library   FakerLibrary
Library   SeleniumLibrary
Resource  variables.robot
*** Keywords ***

OpenBrowserRaja
    Open Browser    https://www.raja.fr/    chrome
    Click Button    xpath=/html/body/div[4]/div[2]/button
    
CRE-SC1-001
    Click Button    xpath=//*[@id="dropdown-account"]/span[1]


