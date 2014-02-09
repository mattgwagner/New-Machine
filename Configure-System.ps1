Import-Module .\Functions

# Install BoxStarter to handle some system configuration
cinst BoxStarter

## System Configuration

Set-ExplorerOptions -showHidenFilesFoldersDrives -showFileExtensions

Disable-InternetExplorerESC

Enable-RemoteDesktop

Enable-MicrosoftUpdate

Update-ExecutionPolicy

## This may not be desired, it'll run all Windows Updates available
Install-WindowsUpdate

## cinst freeSSHD