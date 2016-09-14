@echo off
cls

:question
echo +-----------------------------------+
echo I Welcome in the connection control I
echo +-----------------------------------+
echo.
set var=0
echo etat = %var%
echo.
echo 1/Better connection (only WIFI + Admin)
echo 2/Back to normal (only WIFI + Admin)
echo.
echo 3/Ping
echo 4/Speedlimit
echo 5/Ipconfig
echo 6/My external IP
echo 7/Netstat
echo.
echo 8/Exit
echo.
set /p choix=What do you wanna do ? : 
 
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
echo First test :
netsh int tcp set heuristics disabled
echo.
echo Second test :
netsh interface tcp set global autotuning=disabled
echo.
echo.
echo Connection improved if OK x2
pause
cls

goto question
 
:B
cls
netsh interface tcp set global autotuning=normal
echo Connection back to normal if OK
pause
cls

goto question

:C
cls
echo Hit Ctrl + c to stop
pause
ping -t google.com
cls
goto question

:D
cls
start http://www.speedtest.net/fr/
echo Website opened
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
echo Website opened
pause
cls
goto question

:G
cls
netstat -a
pause
cls
goto question
 
:end
cls
echo End of the program
echo.
Echo Press any key to exit
pause >null
del null
