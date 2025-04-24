# System Information Extraction Script

This script extracts system information, including the BIOS serial number, Windows product key, system UUID, and motherboard serial number. 
It also includes a registry-based method for decoding the Windows product key from the system registry.

The information is collected and saved to an output text file called `OUTPUT.txt`.

## Features
- Extracts **BIOS Serial Number**, **BIOS Version**, and **Manufacturer**.
- Retrieves the **OEM Product Key** from the BIOS (OA3xOriginalProductKey).
- Extracts the **System UUID** for uniquely identifying the system.
- Extracts the **Motherboard Serial Number**.
- Decodes the **Windows Product Key** from the registry (useful for manually installed Windows).

## Usage Instructions

### Prerequisites
- This script is designed to work on **Windows 10** and **Windows 11**.
- **Administrator** privileges are required to run this script.

### OUTPUT
The OUTPUT.txt file will contain:

**BIOS Info** (Serial Number, Version, Manufacturer) 
Get-CimInstance -Class Win32_BIOS

**OEM Product Key from BIOS**
Get-CimInstance -Class SoftwareLicensingService

**System UUID**
Get-CimInstance -Class Win32_ComputerSystemProduct

**Motherboard Serial Number**
Get-CimInstance -Class Win32_BaseBoard

**Decoded Windows Product Key from Registry**
Decodes product key from the system registry
