## Download Chocolatey Package Manager
if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
{
	iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
}

# Install BoxStarter to handle some system configuration
cinst BoxStarter

## System Configuration

Set-ExplorerOptions -showHidenFilesFoldersDrives -showFileExtensions

Disable-InternetExplorerESC

Enable-RemoteDesktop

Enable-MicrosoftUpdate

Update-ExecutionPolicy

Install-WindowsUpdate