SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

PROMPT Entrer nom et mdp (ex: vincent azerty)
Accept nom CHAR PROMPT 'Nom: ';
Accept mdp CHAR PROMPT 'Mot de passe: ';
PROMPT
PROMPT Resultat:

DECLARE
    nom syl.utilisateurs.nom%TYPE := '&nom';
    mdp syl.utilisateurs.mdp%TYPE := '&mdp';
BEGIN
    syl.Utilisateur_Supprimer(nom, mdp);
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;
