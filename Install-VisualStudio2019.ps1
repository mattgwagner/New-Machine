## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

Write-Output "Starting C# Installs"

## Development Tools - .NET

choco install microsoft-build-tools

choco install visualstudio2019community ## visualstudio2019enterprise
choco install visualstudio2019-workload-netweb 
choco install visualstudio2019-workload-azure 
choco install visualstudio2019-workload-netcoretools
choco install visualstudio2019-workload-node
choco install visualstudio2019-workload-netcrossplat

choco install dotnetcore-sdk