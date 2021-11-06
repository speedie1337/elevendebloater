@echo off
title init
:::::::::::::::::::::::::::::::welcome::::::::::::::::::::::::::::::::
::       __                     __    __   __          __           ::
::  ___ / /__ _  _____ ___  ___/ /__ / /  / /__  ___ _/ /____ ____  ::
:: / -_) / -_) |/ / -_) _ \/ _  / -_) _ \/ / _ \/ _ `/ __/ -_) __/  ::
:: \__/_/\__/|___/\__/_//_/\_,_/\__/_.__/_/\___/\_,_/\__/\__/_/ 0.9 ::
::                                                                  ::
::                by speedie                                        :: 
::::::::::\https://github.com/speediegamer/elevendebloater/:::::::::::

:: !!SETTINGS!!
:: Do not recommend changing unless you have a reason to. Defaults should work just fine.
set requireAdmin=true &:: Require Admin and prevent running by accident [true/false] (Highly recommend setting to true as is default)
set keepEDDataExports=true &:: ElevenDebloater saves some information about your machine in %temp%\EDData. Keep or delete on exit? [true/false] (Recommend keeping as true so you can redownload easily)
set logDeletions=true &:: Save what applications get deleted to file [true/false]
set LightMode=false &:: Change background to white for no reason whatsoever [true/false/powershell/leet] (false will make the background black, powershell will make it blue, leet will make the background black, text green)
set InstallMethod=uninstall &:: Choose whether or not to uninstall (debloat) or reinstall the bloatware. [uninstall/install]
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: !!UNSAFE SETTINGS!!
:: NOTE: THESE ARE UNSAFE AND SHOULD NOT BE CHANGED FROM DEFAULTS UNLESS YOU HAVE A SPECIFIC REASON TO DO SO.
:: MOSTLY USEFUL FOR TESTING THINGS!

set wingetAlwaysNotExist=false &:: Option for testing which acts like winget doesn't exist. (Not recommended unless you're testing) [true/false]
set NoPrompt=false &:: Make the debloater run without any if %NoPrompt% equ false pauses or anything. Does not bypass UAC however unless requireAdmin equ false. (Dangerous) [True\False]
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Do not modify anything below this!!                      



:: Setting variables and exporting into the EDData folder
:setVar
if %wingetAlwaysNotExist% equ false set wingetExists=false
cd %temp% && mkdir EDData && cd EDData && cls
systeminfo | findstr /C:"OS Name" > SystemVersion.out && set /p SysVer= < SystemVersion.out &:: Get OS Name, save as SystemVersion.out and set it's contents as variable SysVer
ver > SystemVersion02.out set /p SysVer2= < SystemVersion2.out &:: Get OS Version
winget -v && set wingetExists=true
if %wingetAlwaysNotExist% equ true set wingetExists=false 
if %LightMode% equ true color 70
if %LightMode% equ powershell color 1f
if %LightMode% equ leet color 0a
if %LightMode% equ false color 09
goto intro

:cleanMii
:: I'm sorry, I just couldn't resist..
cd %temp%
del EDData /f /q
del ElevenDebloaterTemp /f /q
exit
::::::::::::::::::::::::::::::

:intro
if %requireAdmin% equ false goto noAdminRequired
net session >nul 2>&1
if %errorLevel% == 0 goto noAdminRequired
cd %temp%\EDData && echo User did not run as admin > ErrorLog.out && exit
:noAdminRequired
start https://github.com/speediegamer/elevendebloater
cls
title ElevenDebloater v0.9 by speedie
echo ::::::::::::::::::::::::::::::::welcome::::::::::::::::::::::::::::::::
echo ::"        __                     __    __   __          __         "::
echo ::"  ___ / /__ _  _____ ___  ___/ /__ / /  / /__  ___ _/ /____ ____ "::
echo ::" / -_) / -_) |/ / -_) _ \/ _  / -_) _ \/ / _ \/ _ `/ __/ -_) __/ "::
echo ::" \__/_/\__/|___/\__/_//_/\_,_/\__/_.__/_/\___/\_,_/\__/\__/_/ 0.9"::
echo ::"                                                                 "::
echo ::"               by speedie                                        "::
echo ::%time%       
echo :: %sysver%
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
echo :: and delete the "EDData" and "ElevenDebloaterTemp" folders in temp::
echo ::                                                                  ::
echo :: This tool is and will always be free for anyone to USE.          ::
echo :: Check the GitHub for license information.                        ::
echo :: https://github.com/speediegamer/elevendebloater                  ::
echo ::                        Thank you!                                ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
if %NoPrompt% equ false pause
cls
cd %temp%\EDData && winget list > EDDataBefore.out
echo :::::::::::::::::::::::::::important::::::::::::::::::::::::::::::::::
echo ElevenDebloater will delete all of these:
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
if %NoPrompt% equ true goto NoPrompt01
echo Microsoft doesn't suck, delete this to change that > bloat
echo To begin deleting.
start cmd
echo Type "del /f /q bloat && exit" in a CMD window to continue.
:deletedcheck
if exist "%temp%\bloat" timeout 1 && goto deletedcheck
:NoPrompt01
cls
echo Starting deletion process.
echo Please wait and be patient. Do not close the tool please.
if %NoPrompt% equ false timeout 5 && cd %temp%\EDData
winget %InstallMethod% microsoft.windowscommunicationsapps_8wekyb3d8bbwe > deleteApp01.out && if %logDeletions% equ false del /f /q deleteApp01.out
winget %InstallMethod% Microsoft.OneDrive > deleteApp02.out && if %logDeletions% equ false del /f /q deleteApp02.out
winget %InstallMethod% MicrosoftTeams_8wekyb3d8bbwe > deleteApp03.out && if %logDeletions% equ false del /f /q deleteApp03.out
winget %InstallMethod% Microsoft.ZuneVideo_8wekyb3d8bbwe > deleteApp04.out && if %logDeletions% equ false del /f /q deleteApp04.out
winget %InstallMethod% Microsoft.ZuneMusic_8wekyb3d8bbwe > deleteApp05.out && if %logDeletions% equ false del /f /q deleteApp01.out
winget %InstallMethod% Microsoft.549981C3F5F10_8wekyb3d8bbwe > deleteApp06.out && if %logDeletions% equ false del /f /q deleteApp06.out
winget %InstallMethod% Microsoft.BingNews_8wekyb3d8bbwe > deleteApp07.out && if %logDeletions% equ false del /f /q deleteApp07.out
winget %InstallMethod% Microsoft.BingWeather_8wekyb3d8bbwe > deleteApp08.out && if %logDeletions% equ false del /f /q deleteApp08.out
winget %InstallMethod% Microsoft.GamingApp_8wekyb3d8bbwe > deleteApp09.out && if %logDeletions% equ false del /f /q deleteApp09.out
winget %InstallMethod% Microsoft.GetHelp_8wekyb3d8bbwe > deleteApp10.out && if %logDeletions% equ false del /f /q deleteApp10.out
winget %InstallMethod% Microsoft.Getstarted_8wekyb3d8bbwe > deleteApp11.out && if %logDeletions% equ false del /f /q deleteApp11.out
winget %InstallMethod% Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe > deleteApp12.out && if %logDeletions% equ false del /f /q deleteApp12.out
winget %InstallMethod% Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe > deleteApp13.out && if %logDeletions% equ false del /f /q deleteApp13.out
winget %InstallMethod% Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe > deleteApp14.out && if %logDeletions% equ false del /f /q deleteApp14.out
winget %InstallMethod% Microsoft.People_8wekyb3d8bbwe > deleteApp15.out && if %logDeletions% equ false del /f /q deleteApp15.out
winget %InstallMethod% Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe > deleteApp16.out && if %logDeletions% equ false del /f /q deleteApp16.out
winget %InstallMethod% Microsoft.Todos_8wekyb3d8bbwe > deleteApp17.out && if %logDeletions% equ false del /f /q deleteApp17.out
winget %InstallMethod% Microsoft.Windows.Photos_8wekyb3d8bbwe > deleteApp18.out && if %logDeletions% equ false del /f /q deleteApp18.out
winget %InstallMethod% Microsoft.WindowsAlarms_8wekyb3d8bbwe > deleteApp19.out && if %logDeletions% equ false del /f /q deleteApp19.out
winget %InstallMethod% Microsoft.WindowsCalculator_8wekyb3d8bbwe > deleteApp20.out && if %logDeletions% equ false del /f /q deleteApp20.out
winget %InstallMethod% Microsoft.WindowsCamera_8wekyb3d8bbwe > deleteApp21.out && if %logDeletions% equ false del /f /q deleteApp21.out
winget %InstallMethod% Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe > deleteApp22.out && if %logDeletions% equ false del /f /q deleteApp22.out
winget %InstallMethod% Microsoft.WindowsMaps_8wekyb3d8bbwe > deleteApp23.out && if %logDeletions% equ false del /f /q deleteApp23.out
winget %InstallMethod% Microsoft.Xbox.TCUI_8wekyb3d8bbwe > deleteApp24.out && if %logDeletions% equ false del /f /q deleteApp24.out
winget %InstallMethod% Microsoft.XboxGameOverlay_8wekyb3d8bbwe > deleteApp25.out && if %logDeletions% equ false del /f /q deleteApp25.out
winget %InstallMethod% Microsoft.XboxGamingOverlay_8wekyb3d8bbwe > deleteApp26.out && if %logDeletions% equ false del /f /q deleteApp26.out
winget %InstallMethod% Microsoft.XboxIdentityProvider_8wekyb3d8bbwe > deleteApp27.out && if %logDeletions% equ false del /f /q deleteApp27.out
winget %InstallMethod% Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe > deleteApp28.out && if %logDeletions% equ false del /f /q deleteApp28.out
winget %InstallMethod% Microsoft.YourPhone_8wekyb3d8bbwe > deleteApp29.out && if %logDeletions% equ false del /f /q deleteApp29.out
winget list > EDDataAfter.out
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ElevenDebloater has debloated your %SysVer2% installation.
echo Here's a list of your remaining apps. Close the window once you're done looking at it.
notepad.exe EDDataAfter.out
cd %temp% && del /f /q ElevenDebloaterTemp
if %keepEDDataExports% equ false goto cleanMii
if %NoPrompt% equ false timeout 2 && echo Exiting && exit
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::





