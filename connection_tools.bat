@echo off
cls

:question
echo +-----------------------------------------+
echo I Bienvenue dans le controle de connexion I
echo +-----------------------------------------+
echo.
set var=0
echo etat = %var%
echo.
echo 1/Meilleure connexion (only WIFI + Admin)
echo 2/Remettre a la normale (only WIFI + Admin)
echo.
echo 3/Ping
echo 4/Tester la vitesse
echo 5/Info config IP
echo 6/Mon IP en ligne
echo 7/Netstat
echo.
echo 8/Quitter
echo.
set /p choix=Que voulez vous faire : 
 
if /I "%choix%"=="1" (goto :A)
if /I "%choix%"=="2" (goto :B)
if /I "%choix%"=="3" (goto :C)
if /I "%choix%"=="4" (goto :D)
if /I "%choix%"=="5" (goto :E)
if /I "%choix%"=="6" (goto :F)
if /I "%choix%"=="7" (goto :G)
if /I "%choix%"=="8" (goto :end)
cls
goto question
 
:A
cls
echo Premier test :
netsh int tcp set heuristics disabled
echo.
echo Deuxieme test :
netsh interface tcp set global autotuning=disabled
echo.
echo.
echo Connexion amelioree si OK x2
pause
cls

goto question
 
:B
cls
netsh interface tcp set global autotuning=normal
echo Connexion remise a la normale si OK
pause
cls

goto question

:C
cls
echo Faites Ctrl + c pour arreter
pause
ping -t google.com
cls
goto question

:D
cls
start http://www.speedtest.net/fr/
echo Site ouvert
pause
cls
goto question

:E
cls
ipconfig
pause
cls
goto question

:F
cls
start http://www.hostip.fr/
echo Site ouvert
pause
cls
goto question

:G
cls
netstat -a
cls
goto question
 
:end
cls
echo Fin du programme
echo.
Echo Appuyez sur une touche pour quitter
pause >null
del null