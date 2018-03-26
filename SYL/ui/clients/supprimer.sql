SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

PROMPT Entrer l'id du client a supprimer
Accept id_client NUMBER PROMPT 'Id client: ';
PROMPT
PROMPT Resultat:

DECLARE
    id_client syl.clients.id%TYPE := &id_client;
BEGIN
    syl.Client_Supprimer(id_client);
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;
