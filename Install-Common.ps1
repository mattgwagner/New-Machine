## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

Write-Output "Starting Common Configuration and Installs"

choco feature enable --name=allowGlobalConfirmation

## System Configuration

# Set-ExplorerOptions -showFileExtensions

Write-Output "Enabling Remote Desktop"

Enable-RemoteDesktop
Set-NetFirewallRule -Name RemoteDesktop-UserMode-In-TCP -Enabled True

Disable-InternetExplorerESC # Turns off Internet Explorer Enhanced Security Configuration that is on by default on Server OS versions.

Disable-BingSearch # Disables the Bing Internet Search when searching from the search field in the taskbar or Start Menu

Write-Host "Hiding Taskbar Search box / button..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0

Write-Host "Hiding Task View button..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0

Write-Output "Enabling and Running Windows Update"

Enable-MicrosoftUpdate

Write-Output "Beginning Chocolatey installs"

## Web Browsers

choco install GoogleChrome
choco install Firefox

## Common System Tools

choco install 7zip.install 
choco install adobereader

## choco install greenshot
choco install cloudapp

choco install google-drive-file-stream --ignore-checksums

## These are more common bare-metal / desktop usage installations

# choco install f.lux
# choco install rdcman
