Import-Module WebAdministration

$appPoolName = "AppPoolName";

$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Path -Parent;

$sourceRoot = Split-Path -Path (Split-Path -Path $MyInvocation.MyCommand.Path -Parent) -Parent;

function Install-Site ([string]$siteName, [string]$relPath, [string]$hostname, [int]$id)
{
	$fullPath = Join-Path $sourceRoot $relPath	
	
	# Allow NetworkService to access the directory
	Set-Permissions $fullPath
	
	# Create the website for the app
	New-Website -Name $siteName -Id $id -ApplicationPool $appPoolName -PhysicalPath $fullPath -HostHeader $hostname
	
	Set-WebConfigurationProperty -filter /system.WebServer/security/authentication/AnonymousAuthentication -name username -value "" -location $siteName
	
	# Adds the hostname entry in the hosts file for DNS resolution
	Add-Content C:\Windows\System32\drivers\etc\hosts "127.0.0.1 $hostname";
}

function Set-Permissions($path)
{
	$acl = Get-Acl $path
	
	$acl.SetAccessRuleProtection($True, $True);
	
	$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("IIS AppPool\$appPoolName", "Read", "ContainerInherit, ObjectInherit", "None", "Allow");
  
	$acl.AddAccessRule($rule);
	
	Set-Acl $path $acl;
}

# Setup AppPool
$appPool = New-WebAppPool -Name $appPoolName;
$appPool.managedRuntimeVersion = "v4.0";
$appPool | Set-Item;

# Setup IIS Websites and Projects

Install-Site "WebSite" "Web Applications\WebSiteCodeGoesHere" 'website.local' 101

Write-Host "You will need to add 'IIS AppPool\$appPoolName' to your SQL Server instance with access to the correct database"