Import-Module .\Functions

## Development Tools - Git

cinst githubforwindows

cinst TortoiseGit

cinst poshgit

## Create a new PowerShell Profile
if (!(test-path $profile)) 
{
    New-Item -path $profile -type file -force
}

## Add the GitHub profile shell
Add-Content $profile ". (Resolve-Path '$env:LOCALAPPDATA\GitHub\shell.ps1')"