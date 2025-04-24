@echo off
:A
mode con:lines=140
Cls
echo                                          []-------------------------------------------[]
echo                                                         github.com/libtiff   
echo                                                    {Toolname:GET WINDOWS KEY}     
echo                                          []-------------------------------------------[]
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Done.
echo.
::The below were depreciated version 24H2 and newer builds
::WMIC BIOS GET SERIALNUMBER >> OUTPUT.txt
::wmic path softwarelicensingservice get OA3xOriginalProductKey > OUTPUT.txt

@echo off
set OutputFile=OUTPUT.txt

:: Clear the file first
echo System Info Report > %OutputFile%
echo ------------------ >> %OutputFile%
echo. >> %OutputFile%

:: BIOS Info
echo [BIOS Info] >> %OutputFile%
powershell -Command "Get-CimInstance -Class Win32_BIOS | Format-List SerialNumber, SMBIOSBIOSVersion, Manufacturer | Out-String | Add-Content -Path \"%OutputFile%\""
echo. >> %OutputFile%

:: OEM Product Key from BIOS
echo [OEM Product Key from BIOS] >> %OutputFile%
powershell -Command "(Get-CimInstance -Class SoftwareLicensingService).OA3xOriginalProductKey | Add-Content -Path \"%OutputFile%\""
echo. >> %OutputFile%

:: System UUID
echo [System UUID] >> %OutputFile%
powershell -Command "(Get-CimInstance -Class Win32_ComputerSystemProduct).UUID | Add-Content -Path \"%OutputFile%\""
echo. >> %OutputFile%

:: Motherboard Serial Number
echo [Motherboard Serial Number] >> %OutputFile%
powershell -Command "(Get-CimInstance -Class Win32_BaseBoard).SerialNumber | Add-Content -Path \"%OutputFile%\""
echo. >> %OutputFile%

:: Registry-based Product Key
echo [Decoded Product Key from Registry] >> %OutputFile%
powershell -Command "function Get-WindowsKey { $keyPath = 'HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion'; $digitalProductId = (Get-ItemProperty -Path $keyPath -Name DigitalProductId).DigitalProductId; $chars = 'BCDFGHJKMPQRTVWXY2346789'; $key = (0..24 | ForEach-Object { $value = 0; 14..0 | ForEach-Object { $value = $value * 256; $value += $digitalProductId[$_ + 52]; $digitalProductId[$_ + 52] = [math]::Floor($value / 24); $value = $value %% 24 }; $chars[$value] }) -join '' -replace '(.{5})(?=.)','$1-'; return $key }; (Get-WindowsKey) | Add-Content -Path \"%OutputFile%\""

echo Done! Info saved in %
