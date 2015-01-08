$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

## Development Tools - Git

choco install git.install

choco install TortoiseGit

choco install poshgit