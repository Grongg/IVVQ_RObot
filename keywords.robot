*** Settings ***
Library   Collections
Library   FakerLibrary  locale=fr_FR
Library   SeleniumLibrary
Library   ExcelLibrary
Resource  variables.robot
*** Keywords ***

OpenBrowserRaja
    Open Browser    https://www.raja.fr/    chrome
    Click Button    xpath=/html/body/div[4]/div[2]/button

Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})

Register Created User
    Open Excel Document   ${data}   1
    ${nbRows}=    Get Length     $(data)
    Log    ${nbRows}
#niquel ça

GetRandomListElement
    [Arguments]    ${list}
    ${tmplist}    Get List Items    ${list}
    Remove From List    ${tmplist}    0
    ${size}    Get Length    ${tmplist}
    Log To Console    size=${size}
    ${numbers}    Evaluate    random.sample(range(1, ${size + 1}), 1)    random
    ${number}    Get From List   ${numbers}    0
    Log To Console    ${number}
    ${number}    Convert To String    ${number}
    [Return]    ${number}
    

CRE-SC1-N01
    Click Element    ${CREATE_ACCNT_ICON}
    Sleep    5
    Click Button     ${CREATE_ACCNT_BTN}
    Sleep    3
    # Click Element    ${STATUT_FIELD_PARTICULIER}
    # Sleep    5
    # Input Text       ${ADRESSE_EMAIL_FIELD}    ${FAKE_MAIL}
    # Sleep    8   
    # Input Password   ${MOT_DE_PASSE_FIELD}     ${FAKE_PASSWORD}
    # Sleep    6
    # Scroll To Element    ${REMEMBERME_CHECKBOX}
    # Sleep    3
    # Click Element    ${REMEMBERME_CHECKBOX}
    # Sleep    3
    ${index}    GetRandomListElement    ${CIVILITE_FIELD}
    Select From List By Index   ${CIVILITE_FIELD}    ${index}
    Sleep    6
    Input Text    ${PRENOM_FIELD}    ${FAKE_FIRSTNAME}
    Sleep    4


CRE-SC2-E001
    #Vérifier Champs Obligatoires Vides
    Open Browser    https://www.raja.fr/    chrome
    # Effectuez les actions pour arriver à l'écran CRE-E001

    # Vérifiez que le bouton "Suivant" est grisé
    Element Should Be Disabled    ${SUIVANT_BUTTON}

    # Cliquez sur le bouton "Suivant" sans remplir les champs obligatoires
    Click Button    ${SUIVANT_BUTTON}

    # Vérifiez les messages d'erreur pour chaque champ vide
    Element Should Be Visible    ${MSG_STATUT}
    Element Should Be Visible    ${MSG_ADRESSE_EMAIL}
    Element Should Be Visible    ${MSG_MOT_DE_PASSE}
    Element Should Be Visible    ${MSG_CIVILITE}
    Element Should Be Visible    ${MSG_PRENOM}
    Element Should Be Visible    ${MSG_NOM}
    Element Should Be Visible    ${MSG_TELEPHONE}

    Close Browser

    


    
    

CRE-SC4-N01
    Input Text    ${ADRESS_FIELD}    ${FAKE_ADRESS}
    Sleep    5
    Input Text    ${ZIP_FIELD}    ${FAKE_ZIP}
    Sleep    5
    Input Text    ${CITY_FIELD}    ${FAKE_CITY}
    Sleep    10

CRE-SC6-N01
    Click Button    ${FINISH_ADRESS_BTN}
    Element Should Be Visible    ${ACCOUNT_DROPDOWN}
    Element Should Be Visible    ${ACCOUNT}

CRE-SC7-N01
    ${txt}=    Get Text    ${MSG-CRE-013}
    Should Be Equal    ${MSG-CRE-013}    Félicitations ! Votre compte a bien été créé.    