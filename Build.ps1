$Timer = [Diagnostics.Stopwatch]::StartNew()

packer build windows-2016.json

$Timer.Stop()

Write-Host "VirtualBox Image Built in $($Timer.Elapsed)"