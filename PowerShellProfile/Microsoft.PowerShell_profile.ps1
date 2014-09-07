## Do things that should be loaded on PS start here

$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

function global:Import($Module)
{
	Import-Module (Join-Path $ScriptPath $Module) -DisableNameChecking
}

Import Git
Import Redis

## function to launch enterprise email in IE

Set-Alias msbuild "$(Get-Content ENV:WINDIR)\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" -Scope global

function Install-Chocolatey()
{
	if(-not $env:ChocolateyInstall -or -not (Test-Path "$env:ChocolateyInstall"))
	{
		Write-Host "Chocolatey Not Found, Installing..."
		iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1')) 
	}
}

function Open-IE ($url)
{    
    $ie = new-object -comobject internetexplorer.application;

    $ie.Navigate($url);

    $ie.Visible = $true;
}

function RemoteDesktop($server)
{
	mstsc /v:"$server" 
}

## "%ProgramFiles%\Internet Explorer\iexplore.exe"

## "%ProgramFiles(x86)%\Mozilla Firefox\firefox.exe"

## "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"

## Try to find an app in x86 or the 'normal' ProgramFiles
function Find-Program($folderName)
{
    $p1 = "C:\Program Files\$folderName"
	
    if(!(test-path $p1))
    {
        $p2 = "C:\Program Files (x86)\$folderName"
        
        if((test-path $p2))
        {
            $p2
        }
    }
    else
    {
        $p1
    }
}

function xsd()
{
	& (Find-Program "Microsoft SDKs\Windows\v7.0A\Bin\xsd.exe") $args
}

function touch($file) 
{
    if(test-path $file) {
        $f = get-item $file;
        $d = get-date
        $f.LastWriteTime = $d
    }
    else
    {
        "" | out-file -FilePath $file -Encoding ASCII
    }
}

function sha1()
{
	<#
		Thank you Brad Wilson
		http://bradwilson.typepad.com/blog/2010/03/calculating-sha1-in-powershell.html
	#>

	[Reflection.Assembly]::LoadWithPartialName("System.Security") | out-null
	$sha1 = new-Object System.Security.Cryptography.SHA1Managed

	$args | %{
		resolve-path $_ | %{
			write-host ([System.IO.Path]::GetFilename($_.Path))

			$file = [System.IO.File]::Open($_.Path, "open", "read")
			$sha1.ComputeHash($file) | %{
				write-host -nonewline $_.ToString("x2")
			}
			$file.Dispose()

			write-host
			write-host
		}
	}
}

function Confirm-IsAdmin()
{
	if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
	{
		Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
		return $false
	}
	
	return $true
}

function Watch-File($filename, $lines = 5)
{
	Get-Content -Path $filename -Tail $lines -Wait
}
Set-Alias tail Watch-File -Scope Global

function Load-Assembly($assembly)
{
	echo $assembly
	
	if(test-path $assembly)
	{
		$assemblyPath = get-item $assembly
		[System.Reflection.Assembly]::LoadFrom($assemblyPath)
	}
	else
	{
		[System.Reflection.Assembly]::LoadWithPartialName("$assembly")
	}
}

function DownloadAndRun($url, $file)
{
	(New-Object net.webclient).DownloadFile($url, $file)

	(New-Object -com shell.application).shellExecute($file)
}

Install-Chocolatey