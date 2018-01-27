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