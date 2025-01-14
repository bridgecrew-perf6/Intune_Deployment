<#
    .NOTES
    =============================================================================
    Author: j0shbl0ck https://github.com/j0shbl0ck
    Version: 1.0.1
    Date: 02.17.22
    Type: Public
    Source: https://docs.microsoft.com/en-us/mem/intune/apps/apps-win32-troubleshoot#detecting-the-win32-app-file-version-by-using-powershell
    Description: Checks if Adobe Acrobat Reader DC is installed.
    =============================================================================
    .README
    Please resort to README.md for additional file setup. 
#>

# File path to AARC 64bit location
$pathone = Test-path "${env:ProgramFiles}\Adobe\Acrobat DC\Acrobat\Acrobat.exe"

# File path to AARC 32bit location
$pathtwo = Test-path "${env:ProgramFiles(x86)}\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"

# Get's host name of device
$hostname = hostname

if(("True" -eq $pathone) -or ("True" -eq $pathtwo))
{
    # Write out a random variable (in this case hostname) to output STDOUT
    $hostname
    Exit 0
}
else
{
    # Exit with non=zero failure code
    Exit 1
}