@echo off
title Loading Elevendebloater 0.91
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Welcome to Elevendebloater 0.91                                                                    ::
:: Below you can change some settings if you find it necessary!                        ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SETTINGS
:: I do not recommend changing any unless you have a reason to. Defaults should work just fine.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set RequireAdmin=true &:: Require Admin and prevent running by accident [true/false] (Highly recommend setting to true as is default)
set KeepMachineInfo=true &:: ElevenDebloater saves some information about your machine in %temp%\LocalMachineInfo. Keep or delete on exit? [true/false] (Recommend keeping as true so you can redownload easily)
set LogDeletions=true &:: Save what applications get deleted to file [true/false]
set ColorMode=false &:: Change background to white for no reason whatsoever [true/false/powershell/leet] (false will make the background black, powershell will make it blue, leet will make the background black, text green)
set InstallMethod=uninstall &:: Choose whether or not to uninstall (debloat) or reinstall the bloatware. [uninstall/install]
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: !!UNSAFE SETTINGS!!
:: NOTE: THESE ARE UNSAFE AND SHOULD NOT BE CHANGED FROM DEFAULTS UNLESS YOU HAVE A SPECIFIC REASON TO DO SO.
:: MOSTLY USEFUL FOR TESTING THINGS!
set ForceWingetUnavailable=false &:: Option for testing which acts like winget doesn't exist. (Not recommended unless you're testing) [true/false]
set NoPrompt=false &:: Make the debloater run without any if %NoPrompt% equ false pauses or anything. Does not bypass UAC however unless RequireAdmin equ false. (Dangerous) [true/false]
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Do not modify anything below this!!                                                                                                                                  ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:StartChecks
if %ForceWingetUnavailable% equ false set wingetExists=false
cd %temp% && mkdir LocalMachineInfo && cd LocalMachineInfo
cls
systeminfo | findstr /C:"OS Name" > SystemVersion && set /p SysVer= < SystemVersion &:: Get OS Name, save as SystemVersion and set it's contents as variable SysVer
ver > SystemVersion02 set /p SysVer2= < SystemVersion2 &:: Get OS Version
winget -v && set wingetExists=true
if %ForceWingetUnavailable% equ true set wingetExists=false 
if %ColorMode% equ true color 70
if %ColorMode% equ powershell color 1f
if %ColorMode% equ leet color 0a
if %ColorMode% equ false color 09
goto AdminCheck

:AdminCheck
if %RequireAdmin% equ false goto ClearAdminCheck
net session >nul 2>&1
if %errorLevel% == 0 goto ClearAdminCheck
cls
echo !!!
echo You must run Elevendebloater as Administrator. This is to prevent running by accident.
echo You can edit the file to change this behaviour! (Line 8)
timeout 5
exit

:ClearAdminCheck
start https://github.com/speediegamer/elevendebloater
cls
title ElevenDebloater v0.91 by speedie
echo ::::::::::::::::::::::::::::::::welcome::::::::::::::::::::::::::::::::
echo ::"        __                     __    __   __          __         "::
echo ::"  ___ / /__ _  _____ ___  ___/ /__ / /  / /__  ___ _/ /____ ____ "::
echo ::" / -_) / -_) |/ / -_) _ \/ _  / -_) _ \/ / _ \/ _ `/ __/ -_) __/ "::
echo ::" \__/_/\__/|___/\__/_//_/\_,_/\__/_.__/_/\___/\_,_/\__/\__/_/0.91"::
echo ::"                                                                 "::
echo ::"               by speedie                                        "::
echo ::%time%       
echo ::%sysver%
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: Press enter to continue / Click the X to run away                :::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
if %NoPrompt% equ false pause
cls
echo :::::::::::::::::::::::::::::::about::::::::::::::::::::::::::::::::::
echo :: thanks to these ppl a lot                                        ::
echo :: - psychoticlabrat : probably first user ever                     ::
echo :: - jornmann : made the fucking awesome ascii font your eyes saw   ::
echo :: - micro$oft : made the window$ package manager $$$$$$$$          ::
echo :: - various other people : various other things                    ::
echo :: - you : thanks for using elevendebloater                         ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
if %NoPrompt% equ false pause
cls

echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Checking if winget is present
cd %temp% && mkdir ElevenDebloaterTemp
:winCheck
if %wingetExists% equ false echo Not present so installing. && powershell -Command "Invoke-Webrequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.1.12653/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -Outfile AppInstallerInstaller.msixbundle" && start AppInstallerInstaller.msixbundle
if %wingetExists% equ true echo Present, continuing..
cls

echo :::::::::::::::::::::::::::important::::::::::::::::::::::::::::::::::
echo :: IMPORTANT: speedie and/or anyone listed in the about/credits is- ::
echo :: at no point responsible for any lost data or broken installs.    ::
echo :: If you do not accept this, please click the X to close this tool-::
echo :: and delete the "LocalMachineInfo" and "ElevenDebloaterTemp"      ::
echo ::                                                                  ::
echo :: This tool is and will always be free for anyone to USE.          ::
echo :: Check the GitHub for license information.                        ::
echo :: https://github.com/speediegamer/elevendebloater                  ::
echo ::                        Thank you!                                ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
if %NoPrompt% equ false pause
cls
cd %temp%\LocalMachineInfo && winget list > LocalMachineInfoBefore

echo :::::::::::::::::::::::::::important::::::::::::::::::::::::::::::::::
echo ElevenDebloater will install or delete all of these:
echo :: Microsoft.WindowsCommunicationsApps_8wekyb3d8bbwe
echo :: Microsoft.OneDrive
echo :: MicrosoftTeams_8wekyb3d8bbwe
echo :: Microsoft.ZuneVideo_8wekyb3d8bbwe
echo :: Microsoft.ZuneMusic_8wekyb3d8bbwe
echo :: Microsoft.549981C3F5F10_8wekyb3d8bbwe
echo :: Microsoft.BingNews_8wekyb3d8bbwe
echo :: Microsoft.BingWeather_8wekyb3d8bbwe
echo :: Microsoft.GamingApp_8wekyb3d8bbwe
echo :: Microsoft.GetHelp_8wekyb3d8bbwe
echo :: Microsoft.Getstarted_8wekyb3d8bbwe
echo :: Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe
echo :: Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe
echo :: Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe
echo :: Microsoft.People_8wekyb3d8bbwe
echo :: Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe
echo :: Microsoft.Todos_8wekyb3d8bbwe
echo :: Microsoft.Windows.Photos_8wekyb3d8bbwe
echo :: Microsoft.WindowsAlarms_8wekyb3d8bbwe
echo :: Microsoft.WindowsCalculator_8wekyb3d8bbwe
echo :: Microsoft.WindowsCamera_8wekyb3d8bbwe
echo :: Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe
echo :: Microsoft.WindowsMaps_8wekyb3d8bbwe
echo :: Microsoft.Xbox.TCUI_8wekyb3d8bbwe
echo :: Microsoft.XboxGameOverlay_8wekyb3d8bbwe
echo :: Microsoft.XboxGamingOverlay_8wekyb3d8bbwe
echo :: Microsoft.XboxIdentityProvider_8wekyb3d8bbwe
echo :: Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe
echo :: Microsoft.YourPhone_8wekyb3d8bbwe
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::
cd %temp%
echo Warning: You are about to %InstallMethod% a bunch of apps (listed above)
echo Are you fully sure you wanna do this? It can be undone by editing the file and reinstalling.
pause
cls
echo ========================================================
echo Starting deletion process.
echo Please wait and be patient. Do not close the tool please.
if %NoPrompt% equ false timeout 1 && cd %temp%\LocalMachineInfo
winget %InstallMethod% microsoft.windowscommunicationsapps_8wekyb3d8bbwe > deleteApp01 && if %LogDeletions% equ false del /f /q deleteApp01
winget %InstallMethod% Microsoft.OneDrive > deleteApp02 && if %LogDeletions% equ false del /f /q deleteApp02
winget %InstallMethod% MicrosoftTeams_8wekyb3d8bbwe > deleteApp03 && if %LogDeletions% equ false del /f /q deleteApp03
winget %InstallMethod% Microsoft.ZuneVideo_8wekyb3d8bbwe > deleteApp04 && if %LogDeletions% equ false del /f /q deleteApp04
winget %InstallMethod% Microsoft.ZuneMusic_8wekyb3d8bbwe > deleteApp05 && if %LogDeletions% equ false del /f /q deleteApp01
winget %InstallMethod% Microsoft.549981C3F5F10_8wekyb3d8bbwe > deleteApp06 && if %LogDeletions% equ false del /f /q deleteApp06
winget %InstallMethod% Microsoft.BingNews_8wekyb3d8bbwe > deleteApp07 && if %LogDeletions% equ false del /f /q deleteApp07
winget %InstallMethod% Microsoft.BingWeather_8wekyb3d8bbwe > deleteApp08 && if %LogDeletions% equ false del /f /q deleteApp08
winget %InstallMethod% Microsoft.GamingApp_8wekyb3d8bbwe > deleteApp09 && if %LogDeletions% equ false del /f /q deleteApp09
winget %InstallMethod% Microsoft.GetHelp_8wekyb3d8bbwe > deleteApp10 && if %LogDeletions% equ false del /f /q deleteApp10
winget %InstallMethod% Microsoft.Getstarted_8wekyb3d8bbwe > deleteApp11 && if %LogDeletions% equ false del /f /q deleteApp11
winget %InstallMethod% Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe > deleteApp12 && if %LogDeletions% equ false del /f /q deleteApp12
winget %InstallMethod% Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe > deleteApp13 && if %LogDeletions% equ false del /f /q deleteApp13
winget %InstallMethod% Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe > deleteApp14 && if %LogDeletions% equ false del /f /q deleteApp14
winget %InstallMethod% Microsoft.People_8wekyb3d8bbwe > deleteApp15 && if %LogDeletions% equ false del /f /q deleteApp15
winget %InstallMethod% Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe > deleteApp16 && if %LogDeletions% equ false del /f /q deleteApp16
winget %InstallMethod% Microsoft.Todos_8wekyb3d8bbwe > deleteApp17 && if %LogDeletions% equ false del /f /q deleteApp17
winget %InstallMethod% Microsoft.Windows.Photos_8wekyb3d8bbwe > deleteApp18 && if %LogDeletions% equ false del /f /q deleteApp18
winget %InstallMethod% Microsoft.WindowsAlarms_8wekyb3d8bbwe > deleteApp19 && if %LogDeletions% equ false del /f /q deleteApp19
winget %InstallMethod% Microsoft.WindowsCalculator_8wekyb3d8bbwe > deleteApp20 && if %LogDeletions% equ false del /f /q deleteApp20
winget %InstallMethod% Microsoft.WindowsCamera_8wekyb3d8bbwe > deleteApp21 && if %LogDeletions% equ false del /f /q deleteApp21
winget %InstallMethod% Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe > deleteApp22 && if %LogDeletions% equ false del /f /q deleteApp22
winget %InstallMethod% Microsoft.WindowsMaps_8wekyb3d8bbwe > deleteApp23 && if %LogDeletions% equ false del /f /q deleteApp23
winget %InstallMethod% Microsoft.Xbox.TCUI_8wekyb3d8bbwe > deleteApp24 && if %LogDeletions% equ false del /f /q deleteApp24
winget %InstallMethod% Microsoft.XboxGameOverlay_8wekyb3d8bbwe > deleteApp25 && if %LogDeletions% equ false del /f /q deleteApp25
winget %InstallMethod% Microsoft.XboxGamingOverlay_8wekyb3d8bbwe > deleteApp26 && if %LogDeletions% equ false del /f /q deleteApp26
winget %InstallMethod% Microsoft.XboxIdentityProvider_8wekyb3d8bbwe > deleteApp27 && if %LogDeletions% equ false del /f /q deleteApp27
winget %InstallMethod% Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe > deleteApp28 && if %LogDeletions% equ false del /f /q deleteApp28
winget %InstallMethod% Microsoft.YourPhone_8wekyb3d8bbwe > deleteApp29 && if %LogDeletions% equ false del /f /q deleteApp29
winget list > LocalMachineInfoAfter
cls

echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ElevenDebloater has debloated your %SysVer2% installation.
echo Here's a list of your remaining apps. Close the window once you're done looking at it.
notepad.exe LocalMachineInfoAfter
cd %temp% && del /f /q ElevenDebloaterTemp
if %KeepMachineInfo% equ true goto NoSaveTemp

del LocalMachineInfo /f /q
del ElevenDebloaterTemp /f /q

:NoSaveTemp
if %NoPrompt% equ false timeout 2 && echo Exiting && exit
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::





