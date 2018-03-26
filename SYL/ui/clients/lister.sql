SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

PROMPT Entrer un critere pour chercher un client par nom ou prenom
Accept critere CHAR PROMPT 'Critere (optionnel): ';
PROMPT
PROMPT Resultat:

DECLARE
    critere syl.clients.nom%TYPE := '&critere';
BEGIN
    syl.Client_Lister(critere);
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;
