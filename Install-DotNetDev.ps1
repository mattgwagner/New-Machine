$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

## Development Tools for .NET

choco install VisualStudioCommunity2013 -packageParameters "/Features:WebTools"

choco install webpi
choco install webpicmd

choco install IIS-WebServerRole -source windowsfeatures
choco install IIS-ASPNET45 -source windowsfeatures
choco install IIS-WebSockets -source windowsfeatures

choco install SQLManagementStudio -source webpi