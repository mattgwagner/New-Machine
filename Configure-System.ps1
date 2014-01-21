## Download Chocolatey Package Manager
if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
{
	iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
}

# Install BoxStarter to handle some system configuration
cinst BoxStarter

## System Configuration

Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions

Disable-InternetExplorerESC

Enable-RemoteDesktop

Enable-MicrosoftUpdate

Update-ExecutionPolicy

# Install-WindowsUpdate

.\Intall-Tools.ps1

.\Install-Plex.ps1

.\Install-CommonDev.ps1

.\Install-Git.ps1

.\Install-DotNetDev.ps1