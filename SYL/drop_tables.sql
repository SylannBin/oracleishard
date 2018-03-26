DROP TRIGGER syl.insert_utilisateur;
DROP TRIGGER syl.insert_role;
DROP TRIGGER syl.insert_compte;
DROP TRIGGER syl.insert_client;

DROP SEQUENCE syl.seq_id_utilisateurs;
DROP SEQUENCE syl.seq_id_roles;
DROP SEQUENCE syl.seq_id_comptes;
DROP SEQUENCE syl.seq_id_clients;

DROP TABLE syl.utilisateurs;
DROP TABLE syl.roles;
DROP TABLE syl.comptes;
DROP TABLE syl.clients;

DROP PACKAGE syl.connection;
