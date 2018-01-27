## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

choco feature enable --name=allowGlobalConfirmation

# choco install boxstarter

## System Configuration

# Set-ExplorerOptions -showFileExtensions
# Update-ExecutionPolicy
# Enable-RemoteDesktop

# Disable-InternetExplorerESC # Server OS only

# Enable-MicrosoftUpdate
# Install-WindowsUpdate -AcceptEula

## Web Browsers

# choco install GoogleChrome
# choco install Firefox

## Common System Tools

choco install ccleaner 
choco install 7zip.install 
choco install notepadplusplus.install
# choco install rdcman
# choco install adobereader

## Development Tools - Git

choco install git.install
choco install TortoiseGit

## Development Tools - .NET

# choco install visualstudiocode

# choco install visualstudio2017professional 
# choco install visualstudio2017-workload-netweb 
# choco install visualstudio2017-workload-azure 
# choco install visualstudio2017-workload-netcoretools

# choco install mssqlserver2014express-defaultinstance 
# choco install mssqlservermanagementstudio2014express

## Development Tools - General

# choco install conemu

# choco install baretail

# choco install redis-64
# choco install redis-desktop-manager

## choco install rabbitmq

## choco install nginx

## choco install mysql
## choco install postgresql

## OCD Settings

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"

&"$env:windir\system32\tzutil.exe" /s "Eastern Standard Time"