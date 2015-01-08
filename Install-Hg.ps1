$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

choco install tortoisehg

choco install posh-hg