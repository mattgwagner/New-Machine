Set-StrictMode -Version Latest

$ErrorActionPreference = 'Stop'

trap {
    Write-Host
    Write-Host "ERROR: $_"
    Write-Host (($_.ScriptStackTrace -split '\r?\n') -replace '^(.*)$','ERROR: $1')
    Write-Host
    Write-Host 'Sleeping for 60m to give you time to look around the virtual machine before self-destruction...'
    Start-Sleep -Seconds (60*60)
    Exit 1
}

if (![Environment]::Is64BitProcess) {
    throw 'this must run in a 64-bit PowerShell session'
}

if (!(New-Object System.Security.Principal.WindowsPrincipal(
    [Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw 'this must run with Administrator privileges (e.g. in a elevated shell session)'
}

Write-Host 'Disabling hibernation...'
powercfg /hibernate off

Write-Host 'Setting the power plan to high performance...'
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

#Write-Host "Cleaning SxS..."
#Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

Write-Host "Cleaning updates.."
Stop-Service -Name wuauserv -Force
Remove-Item c:\Windows\SoftwareDistribution\Download\* -Recurse -Force
Start-Service -Name wuauserv

Write-Host 'Removing temporary files'
#'C:\tmp','C:\Windows\Temp',$env:TEMP | ForEach-Object {
'C:\Windows\Temp',$env:TEMP | ForEach-Object {
    Get-ChildItem $_ -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
}

Write-Host "Optimizing Drive"
Optimize-Volume -DriveLetter C

Write-Host 'Cleanup complete!'
