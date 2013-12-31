## Download Chocolatey Package Manager
if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
{
	iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
}

## Development Tools - .NET

cinst DotNet4.5

cinst webpi

cinst webpicommandline

## cinst VisualStudio2013ExpressWeb

cinst VisualStudio2013Professional -InstallArguments "WebTools"

## IIS Configuration

## cinst IIS7 -source WebPI					# IIS7 with Recommended Config
## cinst IISManagementConsole -source WebPI	# Management Console for IIS
## cinst ASPNET -source WebPI					# Setup ASP.NET in IIS
## cinst UrlRewrite2 -source WebPI            # Url Rewrite is used in some of our apps
## cinst ASPNET_REGIIS_NET4 -source WebPI		# Register .NET 4.5 with IIS

## System Configuration

## cinst openssh

## chocolatey Microsoft-Hyper-V-All -source windowsFeatures