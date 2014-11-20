## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

choco install BoxStarter

## System Configuration
Set-ExplorerOptions -showHidenFilesFoldersDrives -showFileExtensions

Update-ExecutionPolicy
Disable-InternetExplorerESC
Enable-RemoteDesktop
Enable-MicrosoftUpdate

## This may not be desired, it will run all Windows Updates available
Install-WindowsUpdate

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

## Web Browsers
choco install GoogleChrome
choco install Firefox

choco install libreoffice