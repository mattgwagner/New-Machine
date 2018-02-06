## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

Write-Output "Starting Common Configuration and Installs"

choco feature enable --name=allowGlobalConfirmation

## System Configuration

# Set-ExplorerOptions -showFileExtensions

Write-Output "Enabling Remote Desktop"

Enable-RemoteDesktop
Set-NetFirewallRule -Name RemoteDesktop-UserMode-In-TCP -Enabled True

Disable-InternetExplorerESC # Server OS only

Write-Output "Enabling and Running Windows Update"

Enable-MicrosoftUpdate
# Disable-MicrosoftUpdate
# Install-WindowsUpdate -AcceptEula

Write-Output "Beginning Chocolatey installs"

## Web Browsers

choco install GoogleChrome
choco install Firefox

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

# choco install microsoft-build-tools

choco install visualstudiocode

choco install visualstudio2017professional 
choco install visualstudio2017-workload-netweb 
choco install visualstudio2017-workload-azure 
choco install visualstudio2017-workload-netcoretools

choco install sql-server-express
choco install sql-server-management-studio

## Development Tools - Node.JS

choco install node

## Development Tools - General

choco install baretail

# choco install conemu

# choco install redis-64
# choco install redis-desktop-manager

## choco install rabbitmq

## choco install nginx

## choco install mysql
## choco install postgresql