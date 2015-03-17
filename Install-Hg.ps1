$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

## Development Tools - Mercurial

choco install tortoisehg

choco install posh-hg

choco install putty.portable  # for ssh