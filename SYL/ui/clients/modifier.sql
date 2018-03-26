SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

PROMPT Entrer l'id du client. Puis un nouveau nom et un nouveau prenom.
Accept client_id NUMBER PROMPT 'Id client: ';
Accept nom CHAR PROMPT 'Nouveau nom: ';
Accept prenom CHAR PROMPT 'Nouveau prenom: ';
PROMPT
PROMPT Resultat:

DECLARE
    client_id syl.clients.id%TYPE := &client_id;
    nom syl.clients.nom%TYPE := '&nom';
    prenom syl.clients.prenom%TYPE := '&prenom';
BEGIN
    syl.Client_Modifier(client_id, nom, prenom);
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;
