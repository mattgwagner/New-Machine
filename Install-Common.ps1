## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

choco feature enable -n allowGlobalConfirmation

choco install boxstarter

## System Configuration

Set-ExplorerOptions -showFileExtensions
Update-ExecutionPolicy
Enable-RemoteDesktop

Disable-InternetExplorerESC # Server OS only

Enable-MicrosoftUpdate
Install-WindowsUpdate -AcceptEula

## Web Browsers
choco install GoogleChrome
choco install Firefox

## Common System Tools
choco install ccleaner 
choco install 7zip.install 
choco install notepadplusplus.install
choco install grepwin
choco install baretail
choco install rdcman

# Console emulator, tabbed PowerShell ftw

choco install conemu

## choco install redis-64
## choco install redis-desktop-manager

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

choco install visualstudio2017professional 
choco install visualstudio2017-workload-netweb 
choco install visualstudio2017-workload-azure 
choco install visualstudio2017-workload-netcoretools

choco install mssqlserver2014express-defaultinstance 
choco install mssqlservermanagementstudio2014express
