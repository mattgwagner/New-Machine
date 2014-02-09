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

## Install SQL Server tooling
cinst SQLManagementStudio -source webpi
cinst SQLExpressTools -source webpi

## IIS Configuration

cinst IIS-WebServerRole -source windowsfeatures

cinst ASPNET -source webpi
cinst ASPNET_REGIIS -source webpi
cinst DefaultDocument -source webpi
cinst DynamicContentCompression -source webpi
cinst HTTPRedirection -source webpi
cinst IIS7_ExtensionLessURLs -source webpi
cinst IISExpress -source webpi
cinst IISExpress_7_5 -source webpi
cinst IISManagementConsole -source webpi
cinst ISAPIExtensions -source webpi
cinst ISAPIFilters -source webpi
cinst NETExtensibility -source webpi
cinst RequestFiltering -source webpi
cinst StaticContent -source webpi
cinst StaticContentCompression -source webpi
cinst UrlRewrite2 -source webpi
cinst WindowsAuthentication -source webpi