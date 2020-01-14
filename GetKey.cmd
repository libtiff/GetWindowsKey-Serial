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
WMIC BIOS GET SERIALNUMBER >> OUTPUT.txt
wmic path softwarelicensingservice get OA3xOriginalProductKey > OUTPUT.txt
Pause
