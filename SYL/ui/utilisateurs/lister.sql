SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

PROMPT
PROMPT Resultat:

BEGIN
    syl.Utilisateur_Lister();
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;
