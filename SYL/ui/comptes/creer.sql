SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

PROMPT Entrer libelle, solde et nom du client (ex: "compte courant" 256 vincent)
Accept libelle CHAR PROMPT 'Libelle: ';
Accept solde NUMBER PROMPT 'Solde: ';
Accept client_nom CHAR PROMPT 'Nom du client: ';
PROMPT
PROMPT Resultat:

DECLARE
    libelle syl.comptes.libelle%TYPE := '&libelle';
    solde syl.comptes.solde%TYPE := &solde;
    client_nom syl.clients.nom%TYPE := '&client_nom';
BEGIN
    syl.Compte_Creer(libelle, solde, client_nom);
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;
