## Development Tools - Git

choco install git --package-parameters= "/GitAndUnixToolsOnPath /WindowsTerminal /NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration"
choco install TortoiseGit
choco install github-desktop
choco install poshgit

Get-Service -Name ssh-agent | Set-Service -StartupType Manual
