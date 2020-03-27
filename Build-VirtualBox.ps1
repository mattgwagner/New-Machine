$here = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

& "$here\Install-Chocolatey.ps1"

if(!(Test-Path $env:ProgramFiles\Oracle\VirtualBox)) { cinst virtualbox -y }

if(!(Get-Command vagrant -ErrorAction SilentlyContinue)) { cinst vagrant -y }
if(!(Get-Command packer -ErrorAction SilentlyContinue)) { cinst packer -y }

$Timer = [Diagnostics.Stopwatch]::StartNew()

packer build --only=virtualbox-iso windows-2019.json

$Timer.Stop()

Write-Host "VirtualBox Image Built in $($Timer.Elapsed)"
