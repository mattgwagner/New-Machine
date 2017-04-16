## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

choco install boxstarter

## .NET Frameworks -- Some should already be installed
choco install DotNet3.5
choco install DotNet4.5.1

## Web Browsers
choco install GoogleChrome
choco install Firefox

## Common System Tools
choco install ccleaner 7zip.install notepadplusplus.install grepwin

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

## Development Tools - Git

choco install git.install

choco install TortoiseGit

choco install poshgit

## Development Tools for .NET

choco install visualstudio2017professional visualstudio2017-workload-netweb visualstudio2017-workload-azure visualstudio2017-workload-netcoretools -y

choco install mssqlserver2014express-defaultinstance mssqlservermanagementstudio2014express -y

## System Configuration
Enable-MicrosoftUpdate
Set-ExplorerOptions -showFileExtensions
Update-ExecutionPolicy
Enable-RemoteDesktop

Disable-InternetExplorerESC # Server OS only

Install-WindowsUpdate -AcceptEula
