param (
	[string]$packages = $(throw "packages is required")
)

if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
{
	Write-Host "Chocolatey Not Found, Installing..."
	iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
}

chocolatey install "$packages.config"