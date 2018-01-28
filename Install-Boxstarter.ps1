Invoke-Expression ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/mwrock/boxstarter/master/BuildScripts/bootstrapper.ps1'))
Get-Boxstarter -Force

## System Configuration

# Set-ExplorerOptions -showFileExtensions

Enable-RemoteDesktop
Set-NetFirewallRule -Name RemoteDesktop-UserMode-In-TCP -Enabled True

Disable-InternetExplorerESC # Server OS only

Enable-MicrosoftUpdate
# Disable-MicrosoftUpdate
# Install-WindowsUpdate -AcceptEula