CREATE OR REPLACE PROCEDURE Client_Creer (
  in_nom IN syl.clients.nom%TYPE,
  in_prenom IN syl.clients.prenom%TYPE
) AS
  BEGIN
    INSERT INTO syl.clients (prenom, nom)
    VALUES (in_prenom, in_nom);
    COMMIT;
  END;
/

CREATE OR REPLACE PROCEDURE Client_Modifier (
    in_client_id IN syl.clients.id%TYPE,
    in_nom IN syl.clients.nom%TYPE,
    in_prenom IN syl.clients.prenom%TYPE
) AS
    client syl.clients%ROWTYPE;
BEGIN
    SELECT * INTO client FROM clients WHERE id = in_client_id;
    UPDATE clients SET nom = in_nom, prenom = in_prenom
        WHERE id = in_client_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Compte client modifie');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Le compte est incorrecte');
END;
/


CREATE OR REPLACE PROCEDURE Client_Supprimer (
    in_client_id IN syl.clients.id%TYPE
) AS
    client syl.clients%ROWTYPE;
BEGIN
    SELECT * INTO client FROM clients WHERE id = in_client_id;
    DELETE FROM clients WHERE id = in_client_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Compte client '|| in_client_id ||' supprime');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Le compte est incorrecte');
END;
/


CREATE OR REPLACE PROCEDURE Client_Lister (
    in_critere IN syl.clients.nom%TYPE
) AS
BEGIN
    FOR c_client IN (
        SELECT id, nom, prenom FROM clients WHERE (
            LOWER(nom) LIKE '%'||LOWER(in_critere)||'%'
            OR LOWER(prenom) LIKE '%'||LOWER(in_critere)||'%'
        )
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('['||c_client.id||'] '||c_client.nom||' '||c_client.prenom);
    END LOOP;
END;
/
