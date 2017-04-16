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
choco install ccleaner
choco install 7zip.install
choco install notepadplusplus.install
choco install adobereader
choco install greenshot
choco install grepwin

## System Configuration
Enable-MicrosoftUpdate
Set-ExplorerOptions -showFileExtensions
Update-ExecutionPolicy
Enable-RemoteDesktop

Disable-InternetExplorerESC # Server OS only

Install-WindowsUpdate -AcceptEula

## Development Tools for .NET

choco install visualstudio2017professional visualstudio2017-workload-netweb visualstudio2017-workload-azure visualstudio2017-workload-netcoretools -y

choco install mssqlserver2014express mssqlservermanagementstudio2014express -y
