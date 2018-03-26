CREATE OR REPLACE PROCEDURE Utilisateur_Connecter (
    in_nom IN syl.utilisateurs.nom%TYPE,
    in_mdp IN syl.utilisateurs.mdp%TYPE
) AS
    utilisateur_role syl.roles.libelle%TYPE;
BEGIN
    SELECT r.libelle INTO utilisateur_role FROM utilisateurs u, roles r
        WHERE u.role_id = r.id
        AND LOWER(u.nom) = LOWER(in_nom)
        AND u.mdp = in_mdp;
    UPDATE syl.connections SET role = utilisateur_role WHERE id = 1;
    DBMS_OUTPUT.PUT_LINE('Connection reussie');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Mauvais nom ou mot de passe');
END;
/


CREATE OR REPLACE PROCEDURE Utilisateur_Creer (
    in_nom IN syl.utilisateurs.nom%TYPE,
    in_prenom IN syl.utilisateurs.prenom%TYPE,
    in_mdp IN syl.utilisateurs.mdp%TYPE,
    in_role IN syl.roles.libelle%TYPE
) AS
    in_role_id syl.roles.id%TYPE;
    role_courant syl.roles.libelle%TYPE;
BEGIN
    SELECT role into role_courant FROM syl.CONNECTIONS WHERE id = 1;
    IF role_courant = 'Admin' THEN
        SELECT id INTO in_role_id FROM SYL.roles WHERE libelle = in_role;
        DBMS_OUTPUT.PUT_LINE(in_role_id);
        INSERT INTO syl.utilisateurs (prenom, nom, mdp, role_id)
            VALUES (in_prenom, in_nom, in_mdp, in_role_id);
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'Droits insuffisants: '||role_courant||'. Admin necessaire'
        );
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Role introuvable');
    ROLLBACK;
END;
/


CREATE OR REPLACE PROCEDURE Utilisateur_Supprimer (
    in_nom IN syl.utilisateurs.nom%TYPE,
    in_mdp IN syl.utilisateurs.mdp%TYPE
) AS
    role_courant syl.roles.libelle%TYPE;
BEGIN
    SELECT role into role_courant FROM syl.CONNECTIONS WHERE id = 1;
    IF role_courant = 'Admin' THEN
        DELETE FROM utilisateurs
            WHERE LOWER(nom) = LOWER(in_nom)
            AND mdp = in_mdp;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Utilisateur supprime');
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'Droits insuffisants: '||role_courant||'. Admin necessaire'
        );
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Mauvais nom ou mot de passe.');
END;
/


CREATE OR REPLACE PROCEDURE Utilisateur_Lister
AS
    role_courant syl.roles.libelle%TYPE;
BEGIN
    SELECT role into role_courant FROM syl.CONNECTIONS WHERE id = 1;
    IF role_courant = 'Admin' THEN
        FOR c_user IN (
        SELECT u.nom, u.prenom, r.libelle FROM utilisateurs u, roles r
        WHERE u.role_id = r.id
        ) LOOP
            DBMS_OUTPUT.PUT_LINE(
                c_user.nom||' '||c_user.prenom||' ('||c_user.libelle||')'
            );
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'Droits insuffisants: '||role_courant||'. Admin necessaire'
        );
    END IF;
END;
/
