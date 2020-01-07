# SRC: https://github.com/actions/virtual-environments/blob/master/images/win/scripts/Installers/Install-WindowsUpdates.ps1
  
################################################################################
##  File:  Install-WindowsUpdates.ps1
##  Desc:  Install Windows Updates.
##         Should be run at end just before Antivirus.
################################################################################

Write-Host "Run windows updates"
Install-Module -Name PSWindowsUpdate -Force -AllowClobber
Get-WUInstall -WindowsUpdate -AcceptAll -UpdateType Software -IgnoreReboot
Get-WUInstall -MicrosoftUpdate -AcceptAll -IgnoreUserInput -IgnoreReboot
