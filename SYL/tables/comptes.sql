CREATE SEQUENCE syl.seq_id_comptes START WITH 1 INCREMENT BY 1;

CREATE TABLE syl.comptes (
  id NUMBER NOT NULL,
  libelle VARCHAR2(60) NOT NULL,
  solde NUMBER NOT NULL,  -- en centimes (ex: 1 euro / 100)
  client_id NUMBER,
  CONSTRAINT pk_compte PRIMARY KEY (id) USING INDEX TABLESPACE indx_tbs,
  CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES syl.clients (id)
)
TABLESPACE apps_tbs
STORAGE ( initial 50K );

CREATE TRIGGER syl.insert_compte
    BEFORE INSERT ON SYL.comptes
    FOR EACH ROW
BEGIN
    SELECT syl.seq_id_comptes.nextval into :new.id from dual;
END;
/