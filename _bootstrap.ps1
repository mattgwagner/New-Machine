$installScript = 'https://raw.githubusercontent.com/mattgwagner/New-Machine/Install-Common.ps1'
$webLauncherUrl = "http://boxstarter.org/package/nr/url?$installScript"

$IE=new-object -com internetexplorer.application
$IE.navigate2($webLauncherUrl)
$IE.visible=$true
