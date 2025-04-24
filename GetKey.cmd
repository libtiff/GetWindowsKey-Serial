@echo off
:A
mode con:lines=140
Cls
echo                                          []-------------------------------------------[]
echo                                                         libtiff.eu5.net    
echo                                                    {Toolname:GET WINDOWS KEY}     
echo                                          []-------------------------------------------[]
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Done.
echo.
::The below were depreciated version 24H2 and newer builds
::WMIC BIOS GET SERIALNUMBER >> OUTPUT.txt
::wmic path softwarelicensingservice get OA3xOriginalProductKey > OUTPUT.txt


powershell -Command "(Get-CimInstance -Class Win32_BIOS).SerialNumber | Out-File OUTPUT.txt"
powershell -Command "(Get-CimInstance -Query \"SELECT OA3xOriginalProductKey FROM SoftwareLicensingService\").OA3xOriginalProductKey | Out-File OUTPUT.txt"
Pause
