## Development Tools - Git

choco install TortoiseGit
choco install github-desktop
choco install git-credential-winstore

mkdir "$($env:USERPROFILE)\.ssh" # Create .ssh folder for keys

Get-Service -Name ssh-agent | Set-Service -StartupType Manual

Write-Output "Installing PoshGit"

choco install poshgit

RefreshEnv

Write-Output "Installing PoshGit to Profile"

Add-PoshGitToProfile

$env:GIT_SSH = "C:\WINDOWS\System32\OpenSSH\ssh.exe"
