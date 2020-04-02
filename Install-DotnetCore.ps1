$Version = "LTS"  #options: latest, LTS, 2.2, 3.1

$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$Script = ((New-Object System.Net.WebClient).DownloadString('https://dot.net/v1/dotnet-install.ps1'))

$Path = "$ScriptPath/_Install-DotnetCore.ps1"

Add-Content $Path $Script

& $Path -Channel $Version

Remove-Item $Path

RefreshEnv

dotnet tool install --global dotnet-ef