## Development Tools - Git

choco install git --package-parameters= "/GitAndUnixToolsOnPath /WindowsTerminal /NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration"
choco install TortoiseGit
choco install github-desktop
choco install poshgit

mkdir "$($env:USERPROFILE)\.ssh" # Create .ssh folder for keys

Get-Service -Name ssh-agent | Set-Service -StartupType Manual
