$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

## Developer Tools

choco install grepwin
choco install greenshot
choco install baretail

## choco install virtualbox

## choco install vagrant

## choco install freeSSHD