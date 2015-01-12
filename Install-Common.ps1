## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

## .NET Frameworks -- Some should already be installed
choco install DotNet3.5
choco install DotNet4.5.1

## Common System Tools
choco install ccleaner
choco install 7zip.install
choco install notepadplusplus.install
choco install adobereader
choco install f.lux
choco install paint.net
choco install TeamViewer

choco install btsync

## Web Browsers
choco install GoogleChrome
choco install Firefox

choco install libreoffice

choco install BoxStarter

## System Configuration
Enable-MicrosoftUpdate
Set-ExplorerOptions -showFileExtensions

# This really only matters on server OS's
Update-ExecutionPolicy
Disable-InternetExplorerESC
Enable-RemoteDesktop

## This may not be desired, it will run all Windows Updates available
Install-WindowsUpdate
