Set-ExecutionPolicy Bypass -Scope Process -Force; 

if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall")){
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

