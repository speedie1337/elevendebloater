## elevendebloater

Windows "debloater" specifically for Windows 11 (now with 10 support) that relies on the App Installer and "winget"
Made this just because I had some free time and was fucking around with 11 build 21996.1

## Pros 
- Very easy to customize depending on what you want to delete & what to keep
- Can easily be fixed when more shit is added to Windows 11.
- Batch script so the "source" is always public
- Now allows easy reinstallation of deleted apps
- Doesn't require admin if you manually enable it

## Cons 
- Requires modification to the script if you want customization
- Maybe messy code

How to use (Simple)
Download the latest script from well, the latest release and run it. Then just follow the on screen instructions.
#### NOTE: This will delete all the UWP apps that aren't critical for the system to boot.
#### Any Win32 programs and batch/powershell as well as third party and official UWP apps installed after will still work.

How to use (Advanced maybe)
Same as above but if you wanna disable something, just change "true" to "false" as the comments tell you to do.

### NOTE: I am not responsible for any data loss caused by this script. I have tested this on many Windows 11 installs and even use it on my main install but please have  common sense. Thank you!
