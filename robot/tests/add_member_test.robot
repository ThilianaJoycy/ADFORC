*** Settings ***
Documentation  Connexion à la plateforme
Library  SeleniumLibrary

*** Test Cases ***
Connexion : Cas nominal 1
    [Documentation]  Connexion avec un compte qui a les droits: avec le CUID
# Open chrome browser at ADFORC website
    OpenBrowser  https://adforc-app.k8s.adcm.orangecm/  chrome
# Wait for the connexion form to appear on page
    Wait Until Element Is Visible  id=kc-content
# Write username and password in the form
    Input Text  id=username,  FBZW2615
    Input Password  id=password,  amour2Dieu
# Click connexion button
    Click Button  id=kc-login
# Check exact match found
    Page Should Contain    ALLER À L’ESPACE ADMIN
    Click Element    Text=ALLER À L’ESPACE ADMIN

    Location Should Be    https://adforc-app.k8s.adcm.orangecm/admin/members
    Click Element    Text=Ajouter les membres
    Page Should Contain    Charger un fichier de membres

    Assign Id To Element    class=form-input-file-container    upload_file_id
    Choose File    id=upload_file_id    C:\Users\FBZW2615\Downloads\template_members.xlsx
    Click Element    id=upload_file_id
    Element Text Should Be    id=upload_file_id    template_members.xlsx
    Click Element    Text=Enregistrer


# Close the browser
    Close Browser

Connexion : Cas nominal 2
    [Documentation]  Connexion avec un compte qui a les droits: avec le courriel
# Open chrome browser at ADFORC website
    OpenBrowser  https://adforc-app.k8s.adcm.orangecm/  chrome
# Wait for the connexion form to appear on page
    #Select Frame  class=show-frame
    Wait Until Element Is Visible  id=kc-content
# Write email and password in the form
    Input Text  id=username,  joyce.tchimkap@orange.com
    Input Password  id=password,  amour2Dieu
# Click connexion button
    Click Button  id=kc-login
# Check exact match found
    Location Should Be    https://adforc-app.k8s.adcm.orangecm/bourses
    Page Should Contain    Projet de digitalisation processus de sélection des boursiers et associations partenaires d’Orange Cameroun.
    Page Should Contain    BOURSES
    Page Should Contain    FILLES MERES
    Page Should Contain    PROJETS
    Page Should Contain    ALLER À L’ESPACE ADMIN

# Close the browser
    Close Browser

Connexion avec des paramètres erronés
    [Documentation]  Connexion avec des paramètres erronés
# Open chrome browser at AADFORC Admin website
    OpenBrowser    https://adforc-app.k8s.adcm.orangecm/  chrome
# Wait for the connexion form to appear on page
    #Select Frame  class=show-frame
    Wait Until Element Is Visible  id=kc-content
# Write email and password in the form
    Input Text  id=username,  XXDT2421
    Input Password  id=password,  amour2Dieu
# Click connexion button
    Click Button  id=kc-login
# Check exact match found
    Page Should Contain     Nom d'utilisateur ou mot de passe invalide.
    
# Close the browser
    Close Browser