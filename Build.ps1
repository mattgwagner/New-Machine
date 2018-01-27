$here = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

& "Install-Chocolatey.ps1"

if(!(Test-Path $env:ProgramFiles\Oracle\VirtualBox)) { cinst virtualbox -y }

if(!(Get-Command vagrant -ErrorAction SilentlyContinue)) { cinst vagrant -y }
if(!(Get-Command packer -ErrorAction SilentlyContinue)) { cinst packer -y }

$Timer = [Diagnostics.Stopwatch]::StartNew()

packer build windows-2016.json

$Timer.Stop()

Write-Host "VirtualBox Image Built in $($Timer.Elapsed)"