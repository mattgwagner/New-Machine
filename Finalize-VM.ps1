# Source: https://github.com/microsoft/azure-pipelines-image-generation/blob/master/images/win/scripts/Installers/Finalize-VM.ps1

################################################################################
##  File:  Finalize-VM.ps1
##  Team:  CI-Platform
##  Desc:  Clean up folders temp folders after installs to save space
################################################################################

Write-Host "Cleanup WinSxS"
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

$ErrorActionPreference = 'silentlycontinue'

Write-Host "Clean up various directories"
@(
    "C:\\Recovery",
    "$env:windir\\logs",
    "$env:windir\\winsxs\\manifestcache",
    "$env:windir\\Temp",
    "$env:windir\\Installer",
    "$env:TEMP"
) | ForEach-Object {
    if (Test-Path $_) {
        Write-Host "Removing $_"
        try {
            Takeown /d Y /R /f $_
            Icacls $_ /GRANT:r administrators:F /T /c /q  2>&1 | Out-Null
            Remove-Item $_ -Recurse -Force | Out-Null
        }
        catch { $global:error.RemoveAt(0) }
    }
}

$winInstallDir = "$env:windir\\Installer"
New-Item -Path $winInstallDir -ItemType Directory -Force

Write-Host 'Setting the power plan to high performance...'
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

Write-Host "Optimizing Drive"
Optimize-Volume -DriveLetter C

$ErrorActionPreference = 'Continue'