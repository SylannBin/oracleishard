SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

PROMPT Entrer nom et prenom (ex: romain vincent)
Accept nom CHAR PROMPT 'Nom: '
Accept prenom CHAR PROMPT 'Prenom: '
PROMPT
PROMPT Resultat:

DECLARE
    nom syl.clients.nom%TYPE := '&nom';
    prenom syl.clients.prenom%TYPE := '&prenom';
BEGIN
    syl.Compte_ListerParClient(nom, prenom);
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;
