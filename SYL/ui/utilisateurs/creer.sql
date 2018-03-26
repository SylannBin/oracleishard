SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

PROMPT Entrer nom, prenom, mdp et role (ex: romain vincent azerty Lecteur)
Accept nom CHAR PROMPT 'Nom: ';
Accept prenom CHAR PROMPT 'Prenom: ';
Accept mdp CHAR PROMPT 'Mot de passe: ';
Accept role CHAR PROMPT 'Role (Lecteur, Admin): ';
PROMPT
PROMPT Resultat:

DECLARE
    nom syl.utilisateurs.nom%TYPE := '&nom';
    prenom syl.utilisateurs.prenom%TYPE := '&prenom';
    mdp syl.utilisateurs.mdp%TYPE := '&mdp';
    role syl.roles.libelle%TYPE := '&role';
BEGIN
    syl.Utilisateur_Creer(nom, prenom, mdp, role);
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;

