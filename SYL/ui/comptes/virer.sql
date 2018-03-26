SET SERVEROUTPUT ON;
SET ECHO OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;

SPOOL 'historique transactions.log' append;

PROMPT Entrer l'id du compte a debiter, du compte a crediter, puis le montant.
Accept compte_id_1 NUMBER PROMPT 'Id compte 1: ';
Accept compte_id_2 NUMBER PROMPT 'Id compte 2: ';
Accept montant NUMBER PROMPT 'Montant: ';
PROMPT
PROMPT Resultat:

DECLARE
    compte_id_1 syl.comptes.id%TYPE := &compte_id_1;
    compte_id_2 syl.comptes.id%TYPE := &compte_id_2;
    montant syl.comptes.solde%TYPE := &montant;
BEGIN
    syl.Compte_Virer(compte_id_1, compte_id_2, montant);
END;
/

PROMPT

SPOOL OFF;
SET FEEDBACK ON;
EXIT;
