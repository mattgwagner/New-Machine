$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

& "$ScriptPath\PowerShellProfile\Microsoft.PowerShell_profile.ps1"

choco install plexmediaserver

## Filebot is probably optional, but great for handling renaming of tv episodes based on tvdb

choco install filebot