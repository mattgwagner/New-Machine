param (
    [bool]$DoNotVagrantIfy = $false
)

$here = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$Timer = [Diagnostics.Stopwatch]::StartNew()

if($DoNotVagrantIfy)
{
    packer build --only=hyperv-iso --except vagrant-image $here\windows-2022.json 
}
else
{
    packer build --only=hyperv-iso $here\windows-2022.json 
}

$Timer.Stop()

Write-Host "Hyper-V Image Built in $($Timer.Elapsed)"