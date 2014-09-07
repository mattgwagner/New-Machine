$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

## Development Tools - Git

cinst githubforwindows

cinst TortoiseGit

## Create a new PowerShell Profile
if (!(test-path $profile)) 
{
    New-Item -path $profile -type file -force
}

## Add the GitHub profile shell
Add-Content $profile ". (Resolve-Path '$env:LOCALAPPDATA\GitHub\shell.ps1')"