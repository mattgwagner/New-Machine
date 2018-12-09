## Development Tools - Git

choco install git --package-parameters= "/GitAndUnixToolsOnPath /WindowsTerminal /NoShellIntegration"
choco install TortoiseGit
choco install github-desktop

Install-PackageProvider -Name NuGet -Force -Confirm
Install-Module posh-git -Scope CurrentUser -Force -Confirm
