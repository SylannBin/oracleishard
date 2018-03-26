CREATE DATABASE SYL
    USER SYS IDENTIFIED BY oracleiswaytoohard
    USER SYSTEM IDENTIFIED BY oracleiswaytoohard
    LOGFILE GROUP 1 ('C:\Opt\oraclexe\logs\SYL\redo01a.log') SIZE 100M BLOCKSIZE 512,
            GROUP 2 ('C:\Opt\oraclexe\logs\SYL\redo02a.log') SIZE 100M BLOCKSIZE 512,
            GROUP 3 ('C:\Opt\oraclexe\logs\SYL\redo03a.log') SIZE 100M BLOCKSIZE 512
    MAXLOGFILES 32
    MAXLOGMEMBERS 5
    MAXLOGHISTORY 1
    MAXDATAFILES 100
    CHARACTER SET US7ASCII
    NATIONAL CHARACTER SET AL16UTF16
    EXTENT MANAGEMENT LOCAL
           DATAFILE 'C:\Opt\oraclexe\app\oracle\oradata\SYL\system01.dbf' SIZE 325M REUSE
    SYSAUX DATAFILE 'C:\Opt\oraclexe\app\oracle\oradata\SYL\sysaux01.dbf' SIZE 325M REUSE
    DEFAULT TABLESPACE users
           DATAFILE 'C:\Opt\oraclexe\app\oracle\oradata\SYL\users01.dbf'
           SIZE 500M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED
    DEFAULT TEMPORARY TABLESPACE tempts1
           TEMPFILE 'C:\Opt\oraclexe\app\oracle\oradata\SYL\temp01.dbf'
           SIZE 20M REUSE
    UNDO TABLESPACE undotbs
           DATAFILE 'C:\Opt\oraclexe\app\oracle\oradata\SYL\undotbs01.dbf'
           SIZE 200M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
