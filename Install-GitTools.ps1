## Development Tools - Git

choco install git --package-parameters= "/GitAndUnixToolsOnPath /WindowsTerminal /NoShellIntegration"
choco install TortoiseGit
choco install github-desktop

PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force

Get-Service -Name ssh-agent | Set-Service -StartupType Manual
