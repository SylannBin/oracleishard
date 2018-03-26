CREATE SEQUENCE syl.seq_id_roles START WITH 1 INCREMENT BY 1;

CREATE TABLE syl.roles (
  id NUMBER NOT NULL,
  libelle VARCHAR2(15) NOT NULL,
  CONSTRAINT pk_role PRIMARY KEY (id) USING INDEX TABLESPACE indx_tbs
)
TABLESPACE apps_tbs;

CREATE TRIGGER syl.insert_role
    BEFORE INSERT ON syl.roles
    FOR EACH ROW
BEGIN
    SELECT syl.seq_id_roles.nextval into :new.id from dual;
END;
/

-- Permet de gérer la connection d'un utilisateur à l'aide d'une variable globale
-- pas idéal, mais je ne sais pas comment faire autrement
CREATE TABLE syl.connections (
    id NUMBER NOT NULL PRIMARY KEY,
    role VARCHAR2(15) DEFAULT NULL
)
TABLESPACE apps_tbs;

INSERT INTO syl.connections (id) VALUES (1); -- une seule connection dans cet exemple
INSERT INTO syl.roles (libelle) VALUES ('Lecteur');
INSERT INTO syl.roles (libelle) VALUES ('Admin');
