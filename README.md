# Quelques explications s'imposent ...

## Création des variables d'environnement

Les variables ORACLE_SID et ORACLE_HOME sont à préciser (**IMPORTANT**) :

```ini
ORACLE_SID="SYL"
ORACLE_INSTALL="C:\Opt\oraclexe"
ORACLE_DATA="%ORACLE_INSTALL%\app\oracle\oradata"
ORACLE_HOME="%ORACLE_INSTALL%\app\oracle\product\11.2.0\server"
```


## Création nécessaire des dossiers suivants ... (oracle) ...

```shell
mkdir "%ORACLE_INSTALL%\logs\%ORACLE_SID%"
mkdir "%ORACLE_DATA%\%ORACLE_SID%"
mkdir "%ORACLE_INSTALL%\app\oracle\admin\%ORACLE_SID%\adump"
```


## Positionnement du contenu de l'archive

Le dossier `SYL/` et le fichier `initSYL.ora`,
doivent être mis dans le dossier suivant : `%ORACLE_HOME%\database`


## Installation de la base de données

```shell
sqlplus /nolog
> connect SYS AS SYSDBA
**password**
> STARTUP NOMOUNT
> @?/database/SYL/create_db
> create spfile from pfile
> @?/database/SYL/create_tbs
> @?/database/SYL/create_user
> @?/database/SYL/create_procedures
> EXIT
```

## Ajouter les fonctionnalités utiles

```shell
sqlplus /nolog
> connect SYS AS SYSDBA
**password**
> @?\rdbms\admin\catalog.sql
> @?\rdbms\admin\catproc.sql
> @?\rdbms\admin\utlrp.sql
> @?\sqlplus\admin\pupbld.sql
> EXIT
```


## Monte la base de données

Je ne me souviens plus exactement,
mais je sais que j'ai dû relancer la base de données avec la commande :
`STARTUP OPEN`


## Lancer le programme

Dans la console, aller dans le dossier où se trouve le fichier run.cmd
(normalement : SYL/ui).

```shell
run
```


## Contenu ~~de l'archive~~ du projet

- SYL/
    - pkg/
        - client.sql
        - compte.sql
        - utilisateur.sql
    - tables/
        - clients.sql
        - comptes.sql
        - roles.sql
        - utilisateurs.sql
    - ui/
        - clients/
            - creer.sql
            - lister.sql
            - modifier.sql
            - supprimer.sql
        - comptes/
            - consulter.sql
            - creer.sql
            - lister_par_client.sql
            - supprimer.sql
            - virer.sql
        - utilisateurs/
            - connecter.sql
            - creer.sql
            - lister.sql
            - supprimer.sql
    - add_features.sql `**3**`
    - create_db.sql `**1**`
    - create_procedures.sql `**6**`
    - create_tables.sql `**5**`
    - create_tbs.sql `**2**`
    - create_user.sql `**4**`
    - drop_tables.sql
    - run.cmd `**7**`
- initSYL.ora
- LISEZMOI.md
