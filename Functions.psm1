function DownloadAndRun($url, $file)
{
	(New-Object net.webclient).DownloadFile($url, $file)

	(New-Object -com shell.application).shellExecute($file)
}

if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
{
	Write-Host "Chocolatey Not Found, Installing..."
	iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
}

Export-ModuleMember -Function @('DownloadAndRun')