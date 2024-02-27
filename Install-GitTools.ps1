if($IsWindows)
{
    ## Development Tools - Git

    choco install TortoiseGit
    choco install github-desktop
    choco install git-credential-winstore
    choco install gh

    mkdir "$($env:USERPROFILE)\.ssh" # Create .ssh folder for keys

    Get-Service -Name ssh-agent | Set-Service -StartupType Manual

    $env:GIT_SSH = "C:\WINDOWS\System32\OpenSSH\ssh.exe"

}

Write-Output "Installing PoshGit"

PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force