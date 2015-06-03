$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

## Common Developer Tools

choco install baretail
choco install smtp4dev
choco install f.lux

choco install rdcman

# Do we want btsync on all of the machines?
# choco install btsync

## choco install redis-64
## choco install redis-desktop-manager

## choco install virtualbox
## choco install vagrant

## choco install freeSSHD
## choco install Tunnelier

## choco install jenkins

## choco install rabbitmq

## choco install nginx

## choco install sqlite

## choco install mysql
## choco install postgresql

## choco install grails
## choco install scala

## choco install mongodb
## choco install mongovue