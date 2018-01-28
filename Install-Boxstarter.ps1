$Username = "vagrant"
$Password = ConvertTo-SecureString "vagrant" -AsPlainText -Force

Write-Output "Bootstrapping BoxStarter"

Invoke-Expression ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/mwrock/boxstarter/master/BuildScripts/bootstrapper.ps1'))
Get-Boxstarter -Force

$Creds = New-Object System.Management.Automation.PSCredential ($Username, $Password)

Write-Output "Importing BoxStarter module"

Import-Module $env:appdata\boxstarter\boxstarter.chocolatey\boxstarter.chocolatey.psd1
Install-BoxstarterPackage -PackageName a:\Install-Common.ps1 -Credential $Creds