$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

choco install VisualStudioCommunity2013 -InstallArguments "/Features:'WebTools'"

choco install SQLManagementStudio -source webpi

choco install IIS-WebServerRole -source windowsfeatures
choco install IIS-ASPNET45 -source windowsfeatures

choco install webpi