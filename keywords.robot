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
    
    #Faker
    ${FAKE_MAIL}    FakerLibrary.Email
    Set Global Variable    ${FAKE_MAIL}         ${FAKE_MAIL}
    ${FAKE_FIRSTNAME}    FakerLibrary.first_name
    Set Global Variable    ${FAKE_FIRSTNAME}    ${FAKE_FIRSTNAME}
    ${FAKE_LASTNAME}    FakerLibrary.last_name
    Set Global Variable    ${FAKE_LASTNAME}     ${FAKE_LASTNAME}
    ${FAKE_PHONE}    FakerLibrary.Phone Number
    Set Global Variable    ${FAKE_PHONE}        ${FAKE_PHONE}
    ${FAKE_PASSWORD}    FakerLibrary.Password
    Set Global Variable    ${FAKE_PASSWORD}     ${FAKE_PASSWORD}
    ${FAKE_ADRESS}    FakerLibrary.Address
    Set Global Variable    ${FAKE_ADRESS}       ${FAKE_ADRESS}
    ${FAKE_ZIP}    FakerLibrary.Postcode
    Set Global Variable    ${FAKE_ZIP}          ${FAKE_ZIP}
    ${FAKE_CITY}    FakerLibrary.City
    Set Global Variable    ${FAKE_CITY}         ${FAKE_CITY}

Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})

Register Created User
    ${datas}=    Open Excel Document   ${data}   1
    ${nbRows}=    Get Length    $(datas)
    # Log    ${nbRows}

GetRandomListElement
    [Arguments]    ${list}
    ${tmplist}    Get List Items    ${list}
    Remove From List    ${tmplist}    0
    ${size}    Get Length    ${tmplist}
    ${numbers}    Evaluate    random.sample(range(1, ${size + 1}), 1)    random
    ${number}    Get From List   ${numbers}    0
    ${number}    Convert To String    ${number}
    [Return]    ${number}
    

CRE-SC1-N01-2-3
    Click Element    ${CREATE_ACCNT_ICON}
    Sleep    5
    Click Button     ${CREATE_ACCNT_BTN}
    Sleep    3
    Click Element    ${STATUT_FIELD_PARTICULIER}
    Sleep    5
    Input Text       ${ADRESSE_EMAIL_FIELD}        ${FAKE_MAIL}
    Sleep    8   
    Input Password   ${MOT_DE_PASSE_FIELD}         ${FAKE_PASSWORD}
    Sleep    6
    Scroll To Element    ${REMEMBERME_CHECKBOX}
    Sleep    3
    Click Element        ${REMEMBERME_CHECKBOX}
    Sleep    3
    ${index}  GetRandomListElement  ${CIVILITE_FIELD}
    Select From List By Index       ${CIVILITE_FIELD}  ${index}
    Sleep    6
    Input Text    ${PRENOM_FIELD}                  ${FAKE_FIRSTNAME}
    Sleep    4
    Input Text    ${NOM_FIELD}                     ${FAKE_LASTNAME}
    Sleep    3
    Input Text    ${TELEPHONE_FIELD}               ${FAKE_PHONE}
    Sleep    6
    Click Button    ${SUIVANT_BTN}
    Sleep    3

CRE-SC1-N01-4
    Input Text    ${ADRESS_FIELD}    ${FAKE_ADRESS}
    Sleep    8
    Input Text    ${ZIP_FIELD}    ${FAKE_ZIP}
    Sleep    7
    Input Text    ${CITY_FIELD}    ${FAKE_CITY}
    Sleep    16

CRE-SC1-N01-5-6
    Click Button    ${FINISH_ADRESS_BTN}
    Sleep    4
    Element Should Be Visible    ${ACCOUNT}

CRE-SC1-N01-7
    ${txt}=    Get Text    ${MSG-CRE-013}
    Should Be Equal As Strings    ${txt}    ${MSG_SUCCESS_USER}
 


CRE-SC2-E001
    #Vérifier Champs Obligatoires Vides
    # Open Browser    https://www.raja.fr/    chrome
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

    #Close Browser

        
    
