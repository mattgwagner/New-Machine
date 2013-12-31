## Download Chocolatey Package Manager
if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
{
	iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
}

## Development Tools - .NET

cinst DotNet4.0

cinst DotNet4.5

cinst webpi

cinst webpicommandline

## cinst VisualStudio2013ExpressWeb

cinst VisualStudio2013Professional -InstallArguments "WebTools"

## IIS Configuration

cwindowsfeatures  IIS-WebServerRole

## cwebpi IIS7
## cwebpi IISManagementConsole
## cwebpi ASPNET
## cwebpi UrlRewrite2
## cwebpi ASPNET_REGIIS_NET4

## System Configuration

## cinst openssh

## cwindowsfeatures Microsoft-Hyper-V-All