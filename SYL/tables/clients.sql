CREATE SEQUENCE syl.seq_id_clients START WITH 1 INCREMENT BY 1;

CREATE TABLE syl.clients (
    id NUMBER NOT NULL,
    prenom VARCHAR2(60) NOT NULL,
    nom VARCHAR2(60) NOT NULL,
    CONSTRAINT pk_client PRIMARY KEY (id) USING INDEX TABLESPACE indx_tbs
)
TABLESPACE apps_tbs
STORAGE ( initial 50K );

CREATE TRIGGER syl.insert_client
    BEFORE INSERT ON SYL.clients
    FOR EACH ROW
BEGIN
    SELECT syl.seq_id_clients.nextval into :new.id from dual;
END;
/