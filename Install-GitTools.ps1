## Development Tools - Git

choco install git --package-parameters= "/GitAndUnixToolsOnPath /WindowsTerminal /NoShellIntegration"
choco install TortoiseGit
choco install github-desktop

Install-PackageProvider -Name NuGet -Force
Install-Module posh-git -Scope CurrentUser -Force
