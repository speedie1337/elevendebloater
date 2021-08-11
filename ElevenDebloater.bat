@echo off
goto check

:check

net session >nul 2>&1
if %errorLevel% == 0 (
    goto pass
) else (
   mkdir Elevendebloater
   cd %localappdata%\Elevendebloater
   echo Failed to launch because you didn't run me as an Administrator > ErrorLog
   exit
)

pause
:pass
color 1F
title Elevendebloater(0.1) Shitty edition by speedie
start https://github.com/speediegamer/elevendebloater
echo "  ______ _                          _      _     _             _            ";
echo " |  ____| |                        | |    | |   | |           | |           ";
echo " | |__  | | _____   _____ _ __   __| | ___| |__ | | ___   __ _| |_ ___ _ __ ";
echo " |  __| | |/ _ \ \ / / _ \ '_ \ / _\` |/ _ \ '_ \| |/ _ \ / _\` | __/ _ \ '__|";
echo " | |____| |  __/\ V /  __/ | | | (_| |  __/ |_) | | (_) | (_| | ||  __/ |   ";
echo " |______|_|\___| \_/ \___|_| |_|\__,_|\___|_.__/|_|\___/ \__,_|\__\___|_|   ";
echo "     | |   (_) | | |                  | (_) | (_)                           ";
echo "  ___| |__  _| |_| |_ _   _    ___  __| |_| |_ _  ___  _ __                 ";
echo " / __| '_ \| | __| __| | | |  / _ \/ _\` | | __| |/ _ \| '_ \ tm            ";
echo " \__ \ | | | | |_| |_| |_| | |  __/ (_| | | |_| | (_) | | | |               ";
echo " |___/_| |_|_|\__|\__|\__, |  \___|\__,_|_|\__|_|\___/|_| |_|               ";
echo "                       __/ |                                                ";
echo "                      |___/                                                 ";
echo "  _                                     _ _        _                            ";
echo " | |                                   | (_)      (_)                           ";
echo " | |__  _   _   ___ _ __   ___  ___  __| |_  ___   _    __ _ _   _  ___ ___ ___ ";
echo " | '_ \| | | | / __| '_ \ / _ \/ _ \/ _\` | |/ _ \ | |  / _\` | | | |/ _ / __/ __|";
echo " | |_) | |_| | \__ | |_) |  __|  __| (_| | |  __/ | | | (_| | |_| |  __\__ \__ \";
echo " |_.__/ \__, | |___| .__/ \___|\___|\__,_|_|\___| |_|  \__, |\__,_|\___|___|___/";
echo "         __/ |     | |                                  __/ |                   ";
echo "        |___/      |_|                                 |___/                    ";
echo Welcome to Elevendebloater (0.1)
echo This little script will uninstall the UWP crap that Windows 11 comes bundled with.
echo There are other scripts to do this with but this one doesn't use Powershell and also uses the brand new "winget"

cd C:\
echo deletemeplease > YesImSure
rem "delete this directory later to begin deleting."
pause

cls
color 49
echo These apps will be uninstalled unless you modified this file
echo #############################################################
echo windowscommunicationsapps_8wekyb3d8bbwe
echo OneDrive
echo MicrosoftTeams_8wekyb3d8bbwe
echo ZuneVideo_8wekyb3d8bbwe
echo ZuneMusic_8wekyb3d8bbwe
echo 549981C3F5F10_8wekyb3d8bbwe
echo BingNews_8wekyb3d8bbwe
echo BingWeather_8wekyb3d8bbwe
echo GamingApp_8wekyb3d8bbwe
echo GetHelp_8wekyb3d8bbwe
echo Getstarted_8wekyb3d8bbwe
echo MicrosoftOfficeHub_8wekyb3d8bbwe
echo MicrosoftSolitaireCollection_8wekyb3d8bbwe
echo MicrosoftStickyNotes_8wekyb3d8bbwe
echo People_8wekyb3d8bbwe
echo PowerAutomateDesktop_8wekyb3d8bbwe
echo Todos_8wekyb3d8bbwe
echo Windows.Photos_8wekyb3d8bbwe
echo WindowsAlarms_8wekyb3d8bbwe
echo WindowsCalculator_8wekyb3d8bbwe
echo WindowsCamera_8wekyb3d8bbwe
echo WindowsFeedbackHub_8wekyb3d8bbwe
echo WindowsMaps_8wekyb3d8bbwe
echo Xbox.TCUI_8wekyb3d8bbwe
echo XboxGameOverlay_8wekyb3d8bbwe
echo XboxGamingOverlay_8wekyb3d8bbwe
echo XboxIdentityProvider_8wekyb3d8bbwe
echo XboxSpeechToTextOverlay_8wekyb3d8bbwe
echo YourPhone_8wekyb3d8bbwe
echo #############################################################+
echo Are you sure you wanna delete these UWP apps? This cannot be undone.
pause
echo To begin deleting.
start cmd

echo Type "del /f C:\YesImSure" in a CMD window. This is to prevent accidentally running this. Then press enter.
pause

If exist "C:\YesImSure" (
    exit
    rem "you didn't follow the instructions properly :((("
)

:delete

rem deleting stuff
color 1F
title ! DO NOT CLOSE! DELETING APPS !
cls

color 49

rem ##################################################
rem DELETE ANY FROM THIS LIST IF YOU WANT TO KEEP IT
rem ##################################################
winget uninstall microsoft.windowscommunicationsapps_8wekyb3d8bbwe
winget uninstall Microsoft.OneDrive
winget uninstall MicrosoftTeams_8wekyb3d8bbwe
winget uninstall Microsoft.ZuneVideo_8wekyb3d8bbwe
winget uninstall Microsoft.549981C3F5F10_8wekyb3d8bbwe
winget uninstall Microsoft.BingNews_8wekyb3d8bbwe
winget uninstall Microsoft.BingWeather_8wekyb3d8bbwe
winget uninstall Microsoft.GamingApp_8wekyb3d8bbwe
winget uninstall Microsoft.GetHelp_8wekyb3d8bbwe
winget uninstall Microsoft.Getstarted_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe
winget uninstall Microsoft.People_8wekyb3d8bbwe
winget uninstall Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe
winget uninstall Microsoft.Todos_8wekyb3d8bbwe
winget uninstall Microsoft.Windows.Photos_8wekyb3d8bbwe
winget uninstall Microsoft.WindowsAlarms_8wekyb3d8bbwe
winget uninstall Microsoft.WindowsCalculator_8wekyb3d8bbwe
winget uninstall Microsoft.WindowsCamera_8wekyb3d8bbwe
winget uninstall Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe
winget uninstall Microsoft.WindowsMaps_8wekyb3d8bbwe
winget uninstall Microsoft.Xbox.TCUI_8wekyb3d8bbwe
winget uninstall Microsoft.XboxGameOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.XboxGamingOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.XboxIdentityProvider_8wekyb3d8bbwe
winget uninstall Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.YourPhone_8wekyb3d8bbwe
rem ##################################################
rem END
rem ##################################################
cls
echo "                       __ ";
echo " ____                 |  |";
echo "|    \  ___  ___  ___ |  |";
echo "|  |  || . ||   || -_||__|";
echo "|____/ |___||_|_||___||__|";
echo "                          ";
echo DONE!
title DONE!
color AF
echo #######################################################################################
echo Finished deleting UWP trash.
echo Exiting..
echo #######################################################################################
timeout 5
exit
