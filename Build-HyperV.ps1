$here = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

& "$here\Install-Chocolatey.ps1"

if(!(Get-Command vagrant -ErrorAction SilentlyContinue)) { cinst vagrant -y }
if(!(Get-Command packer -ErrorAction SilentlyContinue)) { cinst packer -y }

$Timer = [Diagnostics.Stopwatch]::StartNew()

packer build --only=hyperv-iso windows-2019.json 

$Timer.Stop()

Write-Host "Hyper-V Image Built in $($Timer.Elapsed)"
