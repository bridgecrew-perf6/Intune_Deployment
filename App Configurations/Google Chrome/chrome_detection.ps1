<#
    .NOTES
    =============================================================================
    Author: j0shbl0ck https://github.com/j0shbl0ck
    Version: 1.1.0
    Date: 01.10.22
    Type: Public
    Source One: https://euc365.com/creating-intune-win32-apps/
    Source Two: https://techcommunity.microsoft.com/t5/microsoft-intune/intune-custom-detection-script/m-p/2976839
    Source Three: https://universecitiz3n.tech/intune/Intune-Win32-CustomScript/
    Source Four: https://social.technet.microsoft.com/Forums/en-US/c50de74f-4b68-4e90-ad19-0092aa5d61ac/how-to-set-exit-code-in-powershell-which-will-be-used-by-sccm?forum=configmanagergeneral 
    Description: Used as custom detection script because of Chrome being possibly installed in two locations
    =============================================================================
    .README
    Please resort to README.md for additional file setup. 
#>

# Checks File Explorer if Google Chrome is present on device
$pathone = "C:\Program Files\Google\Chrome\Application\chrome.exe" 
$pathtwo = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"


If($null -eq $pathone -or $null -eq $pathtwo) {

    Write-Output "Google Chrome has not been found"
    Exit 1;

    } else {
    Write-Output "Google Chrome has been found"
    Exit 0;
}