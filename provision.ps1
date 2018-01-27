Set-StrictMode -Version Latest

$ErrorActionPreference = 'Stop'

trap {
    Write-Host
    Write-Host "ERROR: $_"
    Write-Host (($_.ScriptStackTrace -split '\r?\n') -replace '^(.*)$','ERROR: $1')
    Write-Host
    Write-Host 'Sleeping for 60m to give you time to look around the virtual machine before self-destruction...'
    Start-Sleep -Seconds (60*60)
    Exit 1
}

if (![Environment]::Is64BitProcess) {
    throw 'this must run in a 64-bit PowerShell session'
}

if (!(New-Object System.Security.Principal.WindowsPrincipal(
    [Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw 'this must run with Administrator privileges (e.g. in a elevated shell session)'
}

# install OpenSSH (for rsync vagrant shared folders from a linux host and for general use on clients of this base box).
$openSshSetupFilename = 'setupssh-7.6p1-1.exe'
$openSshSetupUrl = "https://www.mls-software.com/files/$openSshSetupFilename"
$openSshSetupHash = '31cdffb879ab73c8ecbcbccab6f3c0f882ab6548'
$openSshSetup = "$env:TEMP\$openSshSetupFilename"
$openSshHome = 'C:\Program Files\OpenSSH'
[Reflection.Assembly]::LoadWithPartialName('System.Web') | Out-Null
$openSshPassword = [Web.Security.Membership]::GeneratePassword(32, 8)
Write-Host "Downloading OpenSSH from $openSshSetupUrl..."
Invoke-WebRequest $openSshSetupUrl -OutFile $openSshSetup
$openSshSetupActualHash = (Get-FileHash $openSshSetup -Algorithm SHA1).Hash
if ($openSshSetupActualHash -ne $openSshSetupHash) {
    throw "the $openSshSetupUrl file hash $openSshSetupActualHash does not match the expected $openSshSetupHash"
}
Write-Host 'Installing OpenSSH...'
&$openSshSetup "/password=$openSshPassword" /S | Out-String -Stream
# remove the annoying ssh banner.
Remove-Item "$openSshHome\etc\banner.txt"
Write-Host 'Installing the default vagrant insecure public key...'
mkdir "$env:USERPROFILE\.ssh" | Out-Null
Invoke-WebRequest `
    'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' `
    -OutFile "$env:USERPROFILE\.ssh\authorized_keys"
# disable StrictModes.
[IO.File]::WriteAllText(
    "$openSshHome\etc\sshd_config",
    ([IO.File]::ReadAllText("$openSshHome\etc\sshd_config") `
        -replace '#?StrictModes yes','StrictModes no'))
Restart-Service opensshd

Write-Host 'Disabling hibernation...'
powercfg /hibernate off

Write-Host 'Setting the power plan to high performance...'
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

# remove temporary files.
'C:\tmp','C:\Windows\Temp',$env:TEMP | ForEach-Object {
    Get-ChildItem $_ -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
}
