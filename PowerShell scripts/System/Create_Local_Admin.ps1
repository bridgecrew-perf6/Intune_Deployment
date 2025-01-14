﻿<#
.SYNOPSIS
    This script creates a localadmin account on the device. Use .\ to login into system.
    Author: Josh Block
.NOTES
    Version: 1.0.4
    Date: 12.21.21
    Type: Public
    =============================================================================
    For Intune Purposes
    -------------------
    Run this script using the logged on credentials:
        - No

    Enforce script signature check:
        - No

    Run script in 64 bit PowerShell Host
        - Yes
    =============================================================================
.LINK
    https://github.com/j0shbl0ck
#>

## For new PS scripters, leave the qoutes, but replace <text>.
## Run this script in PowerShell ISE as admin to properly edit the script.

$ExpectedLocalUser = "<username>"
$Password = ConvertTo-SecureString '<password>' -AsPlainText -Force

Function Create_LocalAdmin
{

    New-LocalUser $ExpectedLocalUser -Password $Password -FullName "<First Last>" -Description "Local Administrator account."
    Add-LocalGroupMember -Group "Administrators" -Member $ExpectedLocalUser
    Set-LocalUser -Name $ExpectedLocalUser -PasswordNeverExpires:$true
}

Try

{

    ## Catch if not found
    $LocaAdminUser = Get-LocalUser -Name $ExpectedLocalUser -ErrorAction Stop 

    ## If an account is found update the password
    Set-LocalUser -Name $ExpectedLocalUser -Password $Password -PasswordNeverExpires:$true

}

Catch

{

    Create_LocalAdmin

}


