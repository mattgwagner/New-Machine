$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

chocolatey install VisualStudioCommunity2013 -InstallArguments "/Features:'WebTools'"

chocolatey install SQLManagementStudio -source webpi

chocolatey install IIS-WebServerRole -source windowsfeatures
chocolatey install IIS-ASPNET45 -source windowsfeatures

chocolatey install webpi