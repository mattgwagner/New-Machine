Import-Module .\Functions

## Development Tools - .NET

## Should figure out if I want the "whole" VS or just the express edition
## cinst VisualStudio2013ExpressWeb
cinst VisualStudio2013Professional -InstallArguments "WebTools"

## These will likely be taken care of by the Visual Studio installer...
cinst DotNet4.0
cinst DotNet4.5

## WebPI is clutch for installing other tooling
cinst webpi
cinst webpicommandline

## IIS Configuration

cinst IIS-WebServerRole -source windowsfeatures

## cwebpi IIS7
## cwebpi IISManagementConsole
## cwebpi ASPNET
## cwebpi UrlRewrite2
## cwebpi ASPNET_REGIIS_NET4