$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

## Common Developer Tools

choco install baretail

choco install rdcman

# Console emulator, tabbed PowerShell ftw

choco install conemu

## choco install redis-64
## choco install redis-desktop-manager

## choco install virtualbox
## choco install vagrant

## choco install freeSSHD
## choco install Tunnelier

## choco install jenkins

## choco install rabbitmq

## choco install nginx

## choco install mysql
## choco install postgresql
