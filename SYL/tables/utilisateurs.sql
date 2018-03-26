CREATE SEQUENCE syl.seq_id_utilisateurs START WITH 1 INCREMENT BY 1;

CREATE TABLE syl.utilisateurs (
  id NUMBER NOT NULL,
  prenom VARCHAR2(60) NOT NULL,
  nom VARCHAR2(60) NOT NULL,
  mdp VARCHAR2(60) NOT NULL,
  role_id NUMBER NOT NULL,
  connecte NUMBER(1) DEFAULT 0, -- boolean
  CONSTRAINT pk_utilisateur PRIMARY KEY (id) USING INDEX TABLESPACE indx_tbs,
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES syl.roles (id)
)
TABLESPACE apps_tbs
STORAGE ( initial 50K );

CREATE TRIGGER syl.insert_utilisateur
    BEFORE INSERT ON syl.utilisateurs
    FOR EACH ROW
BEGIN
    SELECT syl.seq_id_utilisateurs.nextval into :new.id from dual;
END;
/

INSERT INTO syl.utilisateurs (prenom, nom, mdp, role_id)
    VALUES ('Romain', 'Vincent', 'zer123456', 2);
