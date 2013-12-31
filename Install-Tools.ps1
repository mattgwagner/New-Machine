## Download Chocolatey Package Manager
if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
{
	iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
}

## Common Windows Tools

cinst f.lux

cinst picasa

cinst googledrive

cinst notepadplusplus

cinst adobereader

cinst libreoffice

cinst baretail

cinst greenshot

cinst AdobeAIR

cinst paint.net

cinst ccleaner

cinst grepwin

cinst 7zip

cinst thunderbird

## Web Browsers

cinst GoogleChrome

cinst Firefox