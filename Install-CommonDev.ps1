## Download Chocolatey Package Manager
if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
{
	iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
}

## Development Tools - Common

cinst webpi

cinst papercut

## cinst redis

## cinst jenkins

## cinst rabbitmq

## cinst MongoVUE

## Development Tools - Android

## cinst android-sdk

## cinst python3