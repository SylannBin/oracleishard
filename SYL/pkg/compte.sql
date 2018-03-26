CREATE OR REPLACE PROCEDURE Compte_Creer (
    in_libelle IN syl.comptes.libelle%TYPE,
    in_solde IN syl.comptes.solde%TYPE,
    in_client_nom IN syl.clients.nom%TYPE
) AS
    in_client_id syl.clients.id%TYPE;
BEGIN
    SELECT id INTO in_client_id FROM SYL.clients c WHERE c.nom = in_client_nom;
    INSERT INTO syl.comptes (libelle, solde, client_id)
        VALUES (in_libelle, in_solde, in_client_id);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Compte cree');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Role introuvable');
        ROLLBACK;
END;
/


CREATE OR REPLACE PROCEDURE Compte_ListerParClient (
    in_nom IN syl.clients.nom%TYPE,
    in_prenom IN syl.clients.prenom%TYPE
) AS
    BEGIN
        FOR c_compte IN (
            SELECT co.id, co.libelle, co.solde FROM comptes co, clients cl
                WHERE co.client_id = cl.id
                AND LOWER(cl.nom) = LOWER(in_nom)
                AND LOWER(cl.prenom) = LOWER(in_prenom)
        ) LOOP
            DBMS_OUTPUT.PUT_LINE(
                'Compte No.'
                ||c_compte.id||' ('||c_compte.libelle||') : '||c_compte.solde
            );
        END LOOP;
    END;
/


CREATE OR REPLACE PROCEDURE Compte_Supprimer (
    in_compte_id IN syl.comptes.id%TYPE
) AS
BEGIN
    DELETE FROM comptes WHERE id = in_compte_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Compte No.'||in_compte_id||' supprime');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Id de compte incorrecte');
END;
/


CREATE OR REPLACE PROCEDURE Compte_Consulter (
    in_compte_id IN syl.comptes.id%TYPE
) AS
BEGIN
    FOR c_compte IN (
        SELECT co.id, co.libelle, cl.nom, cl.prenom, co.solde
            FROM comptes co, clients cl
            WHERE co.client_id = cl.id
            AND co.id = in_compte_id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            c_compte.nom||' '||c_compte.prenom||' - Compte No.'
            ||c_compte.id||' ('||c_compte.libelle||') : '||c_compte.solde
        );
    END LOOP;
END;
/


CREATE OR REPLACE PROCEDURE Compte_Virer (
    in_compte_id_1 IN syl.comptes.id%TYPE,
    in_compte_id_2 IN syl.comptes.id%TYPE,
    in_montant IN syl.comptes.solde%TYPE
) AS
BEGIN
    UPDATE comptes SET solde = (solde - in_montant)
        WHERE id = in_compte_id_1;
    UPDATE comptes SET solde = (solde + in_montant)
        WHERE id = in_compte_id_2;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Virement effectue');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Echec du virement');
        ROLLBACK;
END;
/
