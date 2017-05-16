# iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mattwagner/New-Machine/bootstrap.ps1'))

$installScript = 'https://raw.githubusercontent.com/mattgwagner/New-Machine/Install-Common.ps1'
$webLauncherUrl = "http://boxstarter.org/package/nr/url?$installScript"

$IE=new-object -com internetexplorer.application
$IE.navigate2($webLauncherUrl)
$IE.visible=$true
