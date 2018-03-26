SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

Accept compte_id NUMBER PROMPT 'Entrer un id de compte (ex: 25): ';
PROMPT
PROMPT Resultat:

DECLARE
    compte_id syl.comptes.id%TYPE := &compte_id;
BEGIN
    syl.Compte_Consulter(compte_id);
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;
