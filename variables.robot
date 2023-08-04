*** Variables ***

#Create account button
${CREATE_ACCNT_ICON}    xpath=//*[@id="dropdown-account"]/span[1]
${CREATE_ACCNT_BTN}     xpath=//*[@id="redirectCreateAccount"]

#Form FIELDS
${STATUT_FIELD_ENTREPRISE}            xpath=//*[@id="userInfoForm"]/div/fieldset/div[1]/label/span
${STATUT_FIELD_PARTICULIER}           xpath=//*[@id="userInfoForm"]/div/fieldset/div[2]/label/span
${ADRESSE_EMAIL_FIELD}    xpath=//*[@id="IdentifiersLogin"]
${MOT_DE_PASSE_FIELD}     xpath=//*[@id="NewPwdPassword"]
${REMEMBERME_CHECKBOX}    xpath=//*[@id="userInfoForm"]/div/div[4]/div/label/span[1]
${CIVILITE_FIELD}         xpath=//*[@id="civilitie"]
${PRENOM_FIELD}           xpath=//*[@id="InfoFirstname"]
${NOM_FIELD}              xpath=//*[@id="InfoLastname"]
${TELEPHONE_FIELD}        xpath=//*[@id="directPhone"]

${SUIVANT_BTN}            xpath=//*[@id="nextStepBtn"]

${ADRESS_FIELD}          xpath=//*[@id="CompaniesAddress"]
${ZIP_FIELD}             xpath=//*[@id="CompaniesPostCode"]
${CITY_FIELD}            xpath=//*[@id="CompaniesCity"]
${FINISH_ADRESS_BTN}     xpath=//*[@id="submitAllForm"]

${ACCOUNT}               xpath=//*[@id="dropdown-account"]
${ACCOUNT_DROPDOWN}      xpath=//*[@id="dropdown-block"]
${MSG-CRE-013}           xpath=//*[@id="dropdown-block"]/section/div/span[2]
${MSG_SUCCESS_USER}=    Félicitations ! Votre compte a bien été créé.

${MSG_STATUT}             xpath://div[@id='MSG-CRE-001']
${MSG_ADRESSE_EMAIL}      xpath://div[@id='MSG-CRE-002']
${MSG_MOT_DE_PASSE}       xpath://div[@id='MSG-CRE-002']
${MSG_CIVILITE}           xpath://div[@id='MSG-CRE-003']
${MSG_PRENOM}             xpath://div[@id='MSG-CRE-002']
${MSG_NOM}                xpath://div[@id='MSG-CRE-002']
${MSG_TELEPHONE}          xpath://div[@id='MSG-CRE-003']

${SUIVANT_BUTTON}         xpath://*[@id="nextStepBtn"]

${data}    ressources/RajaJDD__300__0.xlsx