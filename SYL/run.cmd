@ECHO OFF

TITLE    MaBanque
ECHO     ******************************************************
ECHO     *  Bienvenue dans l'interface de gestion de clients  *
ECHO     *  et de comptes bancaires                           *
ECHO     ******************************************************
ECHO.


REM ----------------------------------------------------------------------------
    :MENU_GENERAL
REM ----------------------------------------------------------------------------
ECHO     ******************************************************
ECHO     *  Accueil                                           *
ECHO     ******************************************************
ECHO     *                                                    *
ECHO     *    1 - Gerer les clients                           *
ECHO     *    2 - Gerer les comptes                           *
ECHO     *    3 - Gerer les utilisateurs                      *
ECHO     *                                                    *
ECHO     *    0 - Quitter l'application                       *
ECHO     *                                                    *
ECHO     ******************************************************
ECHO.
SET /P MENU="[Accueil]: "
ECHO.
       IF "%MENU%" EQU "0" ( GOTO MENU_FIN
) ELSE IF "%MENU%" EQU "1" ( GOTO MENU_CLIENT
) ELSE IF "%MENU%" EQU "2" ( GOTO MENU_COMPTE
) ELSE IF "%MENU%" EQU "3" ( GOTO MENU_UTILISATEUR
) ELSE ( CALL :ERROR "%MENU%" )
GOTO MENU_GENERAL


REM ----------------------------------------------------------------------------
    :MENU_CLIENT
REM ----------------------------------------------------------------------------
ECHO     ******************************************************
ECHO     *  Gestion des clients                               *
ECHO     ******************************************************
ECHO     *                                                    *
ECHO     *    1 - Creer un client                             *
ECHO     *    2 - Modifier un client                          *
ECHO     *    3 - Supprimer un client                         *
ECHO     *    4 - Liste des clients                           *
ECHO     *                                                    *
ECHO     *    0 - Retour au menu general                      *
ECHO     *                                                    *
ECHO     ******************************************************
ECHO.
SET /P SOUS_MENU="[Accueil > client]: "
ECHO.
       IF "%SOUS_MENU%" EQU "0" ( GOTO MENU_GENERAL
) ELSE IF "%SOUS_MENU%" EQU "1" ( CALL :SQLPLUS "clients/creer"
) ELSE IF "%SOUS_MENU%" EQU "2" ( CALL :SQLPLUS "clients/modifier"
) ELSE IF "%SOUS_MENU%" EQU "3" ( CALL :SQLPLUS "clients/supprimer"
) ELSE IF "%SOUS_MENU%" EQU "4" ( CALL :SQLPLUS "clients/lister"
) ELSE ( CALL :ERROR "%SOUS_MENU%" )
GOTO MENU_CLIENT


REM ----------------------------------------------------------------------------
    :MENU_COMPTE
REM ----------------------------------------------------------------------------
ECHO     ******************************************************
ECHO     *  Gestion des comptes                               *
ECHO     ******************************************************
ECHO     *                                                    *
ECHO     *    1 - Creer un compte client                      *
ECHO     *    2 - Liste des comptes d'un client               *
ECHO     *    3 - Supprimer un compte client                  *
ECHO     *    4 - Voire le compte de numero ...               *
ECHO     *    5 - Faire un virement                           *
ECHO     *                                                    *
ECHO     *    0 - Retour au menu general                      *
ECHO     *                                                    *
ECHO     ******************************************************
ECHO.
SET /P SOUS_MENU="[Accueil > Compte]: "
ECHO.
       IF "%SOUS_MENU%" EQU "0" ( GOTO MENU_GENERAL
) ELSE IF "%SOUS_MENU%" EQU "1" ( CALL :SQLPLUS "comptes/creer"
) ELSE IF "%SOUS_MENU%" EQU "2" ( CALL :SQLPLUS "comptes/lister_par_client"
) ELSE IF "%SOUS_MENU%" EQU "3" ( CALL :SQLPLUS "comptes/supprimer"
) ELSE IF "%SOUS_MENU%" EQU "4" ( CALL :SQLPLUS "comptes/consulter"
) ELSE IF "%SOUS_MENU%" EQU "5" ( CALL :SQLPLUS "comptes/virer"
) ELSE ( CALL :ERROR "%SOUS_MENU%" )
GOTO MENU_COMPTE


REM ----------------------------------------------------------------------------
    :MENU_UTILISATEUR
REM ----------------------------------------------------------------------------
ECHO     ******************************************************
ECHO     *  Gestion des utilisateurs                          *
ECHO     ******************************************************
ECHO     *                                                    *
ECHO     *    1 - Creer un utilisateur                        *
ECHO     *    2 - Supprimer un utilisateur                    *
ECHO     *    3 - Liste des utilisateurs                      *
ECHO     *    4 - Se connecter                                *
ECHO     *                                                    *
ECHO     *    0 - Retour au menu general                      *
ECHO     *                                                    *
ECHO     ******************************************************
ECHO.
SET /P SOUS_MENU="[Accueil > Utilisateur]: "
ECHO.
       IF "%SOUS_MENU%" EQU "0" ( GOTO MENU_GENERAL
) ELSE IF "%SOUS_MENU%" EQU "1" ( CALL :SQLPLUS "utilisateurs/creer"
) ELSE IF "%SOUS_MENU%" EQU "2" ( CALL :SQLPLUS "utilisateurs/supprimer"
) ELSE IF "%SOUS_MENU%" EQU "3" ( CALL :SQLPLUS "utilisateurs/lister"
) ELSE IF "%SOUS_MENU%" EQU "4" ( CALL :SQLPLUS "utilisateurs/connecter"
) ELSE ( CALL :ERROR "%SOUS_MENU%" )
GOTO MENU_UTILISATEUR


REM ----------------------------------------------------------------------------
    :SQLPLUS
REM ----------------------------------------------------------------------------
ECHO Lancement procedure sqlplus ("%~1")
sqlplus -S SYL/oracleishard @"ui/%~1.sql"
GOTO :EOF


REM ----------------------------------------------------------------------------
    :ERROR
REM ----------------------------------------------------------------------------
ECHO.
ECHO "Action inconnue: %~1."
ECHO.
GOTO :EOF


REM ----------------------------------------------------------------------------
    :MENU_FIN
REM ----------------------------------------------------------------------------
ECHO     Fin de la gestion des comptes et clients de la banque
EXIT /B
