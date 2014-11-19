$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

## Developer Tools

chocolatey install grepwin
chocolatey install greenshot
chocolatey install baretail

## chocolatey install vagrant

## chocolatey install freeSSHD