*** Settings ***
Resource    keywords.robot
Test Setup    OpenBrowserRaja
#Test Teardown    Close All Browsers

*** Test Cases ***

Creer un profil
    CRE-SC1-N01-2-3
    CRE-SC1-N01-4
    CRE-SC1-N01-5-6
    CRE-SC1-N01-7

Creer_profil_champ_obligatoire_vide
    CRE-SC2-E001

# Creer_profil_mauvais_format_de_donnees_renseignees
#     CRE-SC3-E001

Register
    [Tags]    Registered
    Run Keyword And Continue On Failure    Register Created User
    
# Se connecter


# Rechercher un mot clef

# Valider le panier





