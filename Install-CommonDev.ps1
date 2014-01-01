## Download Chocolatey Package Manager
if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
{
	iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
}

## Development Tools - Common

cinst papercut

## cinst redis

## cinst jenkins

## cinst rabbitmq

## cinst mongodb

## cinst MongoVUE

## Development Tools - Java

cinst java.jdk

## cinst Grails

## Development Tools - Ruby

## cinst ruby

## Development Tools - Android

## cinst android-sdk

## Development Tools - Python

## cinst python3

## cinst python

## cinst easy.install