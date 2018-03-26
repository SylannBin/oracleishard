SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

PROMPT Entrer nom et mdp. ex: Vincent zer123456.
Accept nom CHAR PROMPT 'Nom: ';
Accept mdp CHAR PROMPT 'Mot de passe: ';
PROMPT
PROMPT Resultat:

DECLARE
    nom syl.utilisateurs.nom%TYPE := '&nom';
    mdp syl.utilisateurs.mdp%TYPE := '&mdp';
BEGIN
    syl.Utilisateur_Connecter(nom, mdp);
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;
