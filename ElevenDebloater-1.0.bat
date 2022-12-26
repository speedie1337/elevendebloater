@echo off
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Welcome to elevendebloater 1.0                                                                                             ::
:: Below you can change some settings if you find it necessary!                                                               ::
:: Read notes at the bottom if you're having any issues!!                                                                     ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Basic options
set deletelogs=false &:: Don't save what applications get installed/uninstalled to file [true/false]
set colorscheme=leet &:: Change background to white for no reason whatsoever [true/false/powershell/leet] (false will make the background black, powershell will make it blue, leet will make the background black, text green)
set mode=uninstall &:: Choose whether or not to uninstall (debloat) or reinstall the bloatware. [uninstall/install]

:: Testing options
::
:: I do not recommend using these.
set testing_force_winget_unavailable=false &:: Option for testing which acts like winget doesn't exist. (Not recommended unless you're testing) [true/false]
set testing_no_prompt_user=false &:: Make the debloater run without any if %testing_no_prompt_user% equ false pauses or anything. [true/false]

:: Whitelist options
::
:: Change from false to true to whitelist these (ie. don't delete them)
set whitelist_communicationapps=false &:: Whitelist microsoft.windowscommunicationsapps_8wekyb3d8bbwe [true/false]
set whitelist_onedrive=false &:: Whitelist Microsoft.Onedrive [true/false]
set whitelist_teams=false &:: Whitelist MicrosoftTeams_8wekyb3d8bbwe [true/false]
set whitelist_video=false &:: Whitelist Microsoft.ZuneVideo_8wekyb3d8bbwe [true/false]
set whitelist_music=false &:: Whitelist Microsoft.ZuneMusic_8wekyb3d8bbwe [true/false]
set whitelist_5499=false &:: Whitelist Microsoft.549981C3F5F10_8wekyb3d8bbwe [true/false]
set whitelist_bingnews=false &:: Whitelist Microsoft.BingNews_8wekyb3d8bbwe [true/false]
set whitelist_bingweather=false &:: Whitelist Microsoft.BingWeather_8wekybb3d8bbwe [true/false]
set whitelist_gaming=false &:: Whitelist Microsoft.GamingApp_8wekybb3d8bbwe [true/false]
set whitelist_gethelp=false &:: Whitelist Microsoft.GetHelp_8wekyb3d8bbwe [true/false]
set whitelist_getstarted=false &:: Whitelist Microsoft.Getstarted_8wekyb3d8bbwe [true/false]
set whitelist_officehub=false &:: Whitelist Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe [true/false]
set whitelist_solitaire=false &:: Whitelist Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe [true/false]
set whitelist_stickynotes=false &:: Whitelist Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe [true/false]
set whitelist_people=false &:: Whitelist Microsoft.People_8wekyb3d8bbwe [true/false]
set whitelist_powerautomate=false &:: Whitelist Microsoft.Todos_8wekyb3d8bbwe [true/false]
set whitelist_todos=false &:: Whitelist Microsoft.Todos_8wekyb3d8bbwe [true/false]
set whitelist_photos=false &:: Whitelist Microsoft.Photos_8wekyb3d8bbwe [true/false]
set whitelist_alarms=false &:: Whitelist Microsoft.WindowsAlarms_8wekyb3d8bbwe [true/false]
set whitelist_calculator=false &:: Whitelist Microsoft.WindowsCalculator_8wekyb3d8bbwe [true/false]
set whitelist_camera=false &:: Whitelist Microsoft.WindowsCamera_8wekyb3d8bbwe [true/false]
set whitelist_feedbackhub=false &:: Whitelist Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe [true/false]
set whitelist_maps=false &:: Whitelist Microsoft.WindowsMaps_8wekyb3d8bbwe [true/false]
set whitelist_xbox=false &:: Whitelist Microsoft.GamingApp_8wekyb3d8bbwe [true/false]
set whitelist_xboxtcui=false &:: Whitelist Microsoft.Xbox.TCUI_8wekyb3d8bbwe [true/false]
set whitelist_xboxgameoverlay=false &:: Whitelist Microsoft.XboxGameOverlay_8wekyb3d8bbwe [true/false]
set whitelist_xboxidentity=false &:: Whitelist Microsoft.XboxIdentityProvider_8wekyb3d8bbwe [true/false]
set whitelist_xboxspeechtotext=false &:: Whitelist Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe [true/false]
set whitelist_xboxapp=false &:: Whitelist Microsoft.XboxApp_8wekyb3d8bbwe [true/false]
set whitelist_yourphone=false &:: Whitelist Microsoft.YourPhone_8wekyb3d8bbwe [true/false]
set whitelist_edge=false &:: Whitelist Microsoft.Edge [true/false]
set whitelist_edgewebview2=false &:: Whitelist Microsoft.EdgeWebView2Runtime [true/false]
set whitelist_paint3d=false &:: Whitelist Microsoft.Paint_8wekyb3d8bbwe [true/false]
set whitelist_onenote=false &:: Whitelist Microsoft.Office.OneNote_8wekyb3d8bbwe [true/false]
set whitelist_skype=false &:: Whitelist Microsoft.SkypeApp_kzf8qxf38zg5c [true/false]
set whitelist_store=false &:: Whitelist Microsoft.WindowsStore_8wekyb3d8bbwe [true/false]
set whitelist_storehost=false &:: Whitelist Microsoft.StorePurchaseApp_8wekyb3d8bbwe [true/false]
set whitelist_mixedrealityportal=false &:: Whitelist Microsoft.MixedReality.Portal_8wekyb3d8bbwe [true/false]
set whitelist_3dviewer=false &:: Whitelist Microsoft.Microsoft3DViewer_8wekyb3d8bbwe [true/false]
set whitelist_security=true &:: Whitelist Microsoft.SecHealthUI_8wekyb3d8bbwe [true/false]
set whitelist_snippingtool=true &:: Whitelist Microsoft.ScreenSketch_8wekyb3d8bbwe [true/false]
set whitelist_powerautomate=false &:: Whitelist Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe [true/false]
set whitelist_teams=false &:: Whitelist MicrosoftTeams_8wekyb3d8bbwe [true/false]
set whitelist_pchealthcheck=false &:: Whitelist Microsoft.WindowsPCHealthCheck [true/false]

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
title Loading elevendebloater 1.0

:StartChecks
if %testing_force_winget_unavailable% equ false set wingetExists=false
cd %temp% && mkdir elevendebloater && cd elevendebloater
cls

winget -v && set wingetExists=true || exit &:: Check if winget exists

if %testing_force_winget_unavailable% equ true set wingetExists=false
if %colorscheme% equ true color 70
if %colorscheme% equ powershell color 1f
if %colorscheme% equ leet color 0a
if %colorscheme% equ false color 09

cls
title elevendebloater
echo :: Welcome ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: elevendebloater v1.0                                               ::
echo ::                                                                    ::
echo :: by speedie                                                         ::
echo :: https://speedie.gq/projects/elevendebloater.php                    ::
echo :: https://github.com/speediegq/elevendebloater                       ::
echo ::                                                                    ::
echo :: If you find this project useful, consider donating:                ::
echo :: https://speedie.gq/donate.php                                      ::
echo ::                                                                    ::
echo :: Licensed under the GNU General Public License Version 3.0.         ::
echo :: See LICENSE file for more information.                             ::
echo ::                                                                    ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
if %testing_no_prompt_user% equ false pause
cls
echo :: Credits ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::   Thanks to these people:                                          ::
echo :: - psychoticlabrat: Probably the first elevendebloater user         ::
echo :: - Microsoft: Made the Windows package manager 'winget'             ::
echo :: - You: Thanks for using elevendebloater.                           ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
if %testing_no_prompt_user% equ false pause
cls
echo :: Warning ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: Warning: In approximately two keypresses, elevendebloater is going ::
echo :: to install/uninstall a lot of bloat.                               ::
echo ::                                                                    ::
echo :: Enter Y to continue with this.                                     ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
choice /c YN
if %errorlevel%==2 exit
cls
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Checking if winget is present
cd %temp% && mkdir .ed_temp
:winCheck
if %wingetExists% equ false echo Not present so installing. && powershell -Command "Invoke-Webrequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.1.12653/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -Outfile AppInstallerInstaller.msixbundle" && start AppInstallerInstaller.msixbundle
if %wingetExists% equ true echo Present, continuing..
cls

cd %temp%\elevendebloater
winget list > log_preinstallapps

if %colorscheme% equ true color 74 &:: Set text to red because scary and cool
if %colorscheme% equ false color 04 &:: Set text to red because scary and cool
if %colorscheme% equ leet color 04 &:: Set text to red because scary and cool
if %colorscheme% equ powershell color 14 &:: Set text to red because scary and cool

cd %temp%
winget -v && set wingetexists=true &:: Check if winget exists
if %wingetexists% neq true cmd /c echo You must agree to the agreement or it will not work!! && winget list && exit
winget -v && set wingetexists=leet
if %testing_force_winget_unavailable% equ true set wingetexists=true
if %wingetexists% neq leet cls && echo Your Micro$oft Window$ version is not supported. This could be because Winget isn't compatible with your Windows version. && timeout 3 && echo Exiting && timeout 1 && exit
cls

:: Colors
if %colorscheme% equ true color 70 &:: Reset colors
if %colorscheme% equ powershell color 1f &:: Reset colors
if %colorscheme% equ leet color 0a &:: Reset colors
if %colorscheme% equ false color 09 &:: Reset colors

cls
echo Starting deletion process.
echo Please wait and be patient. Do not close the tool please.
cd %temp%\elevendebloater

if %whitelist_communicationapps% equ false winget %mode% microsoft.windowscommunicationsapps_8wekyb3d8bbwe > log
if %whitelist_onedrive% equ false winget %mode% Microsoft.OneDrive >> log
if %whitelist_onenote% equ false winget %mode% Microsoft.Office.OneNote_8wekyb3d8bbwe >> log
if %whitelist_teams% equ false winget %mode% MicrosoftTeams_8wekyb3d8bbwe >> log
if %whitelist_video% equ false winget %mode% Microsoft.ZuneVideo_8wekyb3d8bbwe >> log
if %whitelist_music% equ false winget %mode% Microsoft.ZuneMusic_8wekyb3d8bbwe >> log
if %whitelist_5499% equ false winget %mode% Microsoft.549981C3F5F10_8wekyb3d8bbwe >> log
if %whitelist_bingnews% equ false winget %mode% Microsoft.BingNews_8wekyb3d8bbwe >> log
if %whitelist_bingweather% equ false winget %mode% Microsoft.BingWeather_8wekyb3d8bbwe >> log
if %whitelist_gaming% equ false winget %mode% Microsoft.GamingApp_8wekyb3d8bbwe >> log
if %whitelist_gethelp% equ false winget %mode% Microsoft.GetHelp_8wekyb3d8bbwe >> log
if %whitelist_getstarted% equ false winget %mode% Microsoft.Getstarted_8wekyb3d8bbwe >> log
if %whitelist_officehub% equ false winget %mode% Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe >> log
if %whitelist_solitaire% equ false winget %mode% Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe >> log
if %whitelist_stickynotes% equ false winget %mode% Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe >> log
if %whitelist_people% equ false winget %mode% Microsoft.People_8wekyb3d8bbwe >> log
if %whitelist_powerautomate% equ false winget %mode% Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe >> log
if %whitelist_todos% equ false winget %mode% Microsoft.Todos_8wekyb3d8bbwe >> log
if %whitelist_photos% equ false winget %mode% Microsoft.Windows.Photos_8wekyb3d8bbwe >> log
if %whitelist_alarms% equ false winget %mode% Microsoft.WindowsAlarms_8wekyb3d8bbwe >> log
if %whitelist_calculator% equ false winget %mode% Microsoft.WindowsCalculator_8wekyb3d8bbwe >> log
if %whitelist_camera% equ false winget %mode% Microsoft.WindowsCamera_8wekyb3d8bbwe >> log
if %whitelist_feedbackhub% equ false winget %mode% Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe >> log
if %whitelist_maps% equ false winget %mode% Microsoft.WindowsMaps_8wekyb3d8bbwe >> log
if %whitelist_xbox% equ false winget %mode% Microsoft.GamingApp_8wekyb3d8bbwe >> log
if %whitelist_xboxtcui% equ false winget %mode% Microsoft.Xbox.TCUI_8wekyb3d8bbwe >> log
if %whitelist_xboxgameoverlay% equ false winget %mode% Microsoft.XboxGameOverlay_8wekyb3d8bbwe >> log
if %whitelist_xboxidentity% equ false winget %mode% Microsoft.XboxIdentityProvider_8wekyb3d8bbwe >> log
if %whitelist_xboxspeechtotext% equ false winget %mode% Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe >> log
if %whitelist_xboxapp% equ false winget %mode% Microsoft.XboxApp_8wekyb3d8bbwe >> log
if %whitelist_yourphone% equ false winget %mode% Microsoft.YourPhone_8wekyb3d8bbwe >> log
if %whitelist_edge% equ false winget %mode% Microsoft.Edge >> log
if %whitelist_edgewebview2% equ false winget %mode% Microsoft.EdgeWebView2Runtime >> log
if %whitelist_paint3d% equ false winget %mode% Microsoft.Paint_8wekyb3d8bbwe >> log
if %whitelist_skype% equ false winget %mode% Microsoft.SkypeApp_kzf8qxf38zg5c >> log
if %whitelist_storehost% equ false winget %mode% Microsoft.StorePurchaseApp_8wekyb3d8bbwe >> log
if %whitelist_store% equ false winget %mode% Microsoft.WindowsStore_8wekyb3d8bbwe >> log
if %whitelist_mixedrealityportal% equ false winget %mode% Microsoft.MixedReality.Portal_8wekyb3d8bbwe >> log
if %whitelist_3dviewer% equ false winget %mode% Microsoft.Microsoft3DViewer_8wekyb3d8bbwe >> log
if %whitelist_security% equ false winget %mode% Microsoft.SecHealthUI_8wekyb3d8bbwe >> log
if %whitelist_snippingtool% equ false winget %mode% Microsoft.ScreenSketch_8wekyb3d8bbwe >> log
if %whitelist_powerautomate% equ false winget %mode% Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe >> log
if %whitelist_teams% equ false winget %mode% MicrosoftTeams_8wekyb3d8bbwe >> log
if %whitelist_pchealthcheck% equ false winget %mode% Microsoft.WindowsPCHealthCheck >> log

if %deletelogs% equ true del /f /q log
winget list > log_postinstallapps
cls
echo elevendebloater has debloated your Microsoft Windows 10/11 installation.
echo A list of your remaining applications has been written as well, see %localappdata%/elevendebloater/log_postinstallapps.
cd %temp% && del /f /q .ed_temp

pause && echo Exiting && exit

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Thank you for using elevendebloater!!

NOTE: If you have any issues to report, report at https://github.com/speediegq/elevendebloater/issues
NOTE 2: I recently noticed that Softpedia has mirrored my tool. This is fine, I don't mind. If you get malware after downloading from there
or if the tool has been modified in a way you don't like, please do not ask me for support.
NOTE 3: If you are running Windows 10 LTSC 2019/2021, know that this tool is not compatible with that. (why would you use it with LTSC anyway)