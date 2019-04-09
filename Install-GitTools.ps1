## Development Tools - Git

choco install git --package-parameters= "/GitAndUnixToolsOnPath /WindowsTerminal /NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration"
choco install TortoiseGit
choco install github-desktop

Install-PackageProvider -Name NuGet -Force
Install-Module posh-git -Scope CurrentUser -Force

Get-Service -Name ssh-agent | Set-Service -StartupType Manual
