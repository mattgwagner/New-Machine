$here = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$Timer = [Diagnostics.Stopwatch]::StartNew()

packer build --only=hyperv-iso $here\windows-10-enterprise.json

$Timer.Stop()

Write-Host "Hyper-V Image Built in $($Timer.Elapsed)"