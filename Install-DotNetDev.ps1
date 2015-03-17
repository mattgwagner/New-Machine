$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

choco install webpi
choco install webpicmd

choco install VisualStudioCommunity2013

choco install IIS-WebServerRole -source windowsfeatures
choco install IIS-ASPNET45 -source windowsfeatures

choco install SQLManagementStudio -source webpi

## Common Developer Tools

choco install baretail

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