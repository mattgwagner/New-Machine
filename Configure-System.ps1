Import-Module .\Functions

# Install BoxStarter to handle some system configuration
cinst BoxStarter

## System Configuration

Set-ExplorerOptions -showHidenFilesFoldersDrives -showFileExtensions

Disable-InternetExplorerESC

Enable-RemoteDesktop

Enable-MicrosoftUpdate

Update-ExecutionPolicy

Install-WindowsUpdate

## cinst freeSSHD