*** Settings ***
Library   Collections
Library   FakerLibrary
Library   SeleniumLibrary
Resource  variables.robot

*** Keywords ***

test init
    Open Browser    https://www.raja.fr/    chrome