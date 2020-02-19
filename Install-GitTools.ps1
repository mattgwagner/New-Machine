## Development Tools - Git

choco install git --package-parameters= "/GitAndUnixToolsOnPath /WindowsTerminal /NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration"
choco install TortoiseGit
choco install github-desktop

mkdir "$($env:USERPROFILE)\.ssh" # Create .ssh folder for keys

Get-Service -Name ssh-agent | Set-Service -StartupType Manual

PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force

Add-PoshGitToProfile
