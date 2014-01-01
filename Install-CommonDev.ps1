## Download Chocolatey Package Manager
if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
{
	iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
}

## Development Tools - Common

cinst papercut

cinst Microsoft-Hyper-V-All -source windowsFeatures

## cinst virtualbox

## cinst vagrant

## cinst jenkins

## cinst rabbitmq

## cinst nginx

## Development Tools - Databases

## cinst SQLite

## cinst redis

## cinst mongodb

## cinst MongoVUE

## cinst mysql

## cinst postgresql

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