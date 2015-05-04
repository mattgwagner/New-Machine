## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

## TODO Ensure chocolatey is installed if we're running this script directly

choco install BoxStarter

## System Configuration
Enable-MicrosoftUpdate
Set-ExplorerOptions -showFileExtensions

# This really only matters on server OS's
Update-ExecutionPolicy
Disable-InternetExplorerESC
Enable-RemoteDesktop

## .NET Frameworks -- Some should already be installed
choco install DotNet3.5
choco install DotNet4.5.1

## Web Browsers
choco install GoogleChrome
choco install Firefox

## Common System Tools
choco install ccleaner
choco install 7zip.install
choco install notepadplusplus.install
choco install adobereader
choco install greenshot
choco install grepwin
choco install javaruntime

choco install libreoffice

## This might not be useful for non-desktop machines?
choco install f.lux

# Do we want btsync on all of the machines?
# choco install btsync

## Run all available Windows Updates
Install-WindowsUpdate -AcceptEula
