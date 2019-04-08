## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

Write-Output "Starting C# Installs"

## Development Tools - .NET

choco install microsoft-build-tools

choco install visualstudio2019community ## visualstudio2019enterprise
choco install visualstudio2019-workload-netweb 
choco install visualstudio2019-workload-azure 
choco install visualstudio2019-workload-netcoretools

## This might belong under the node tools, should check to see if the visualstudio2019community package is installed

choco install visualstudio2019-workload-node

# choco install dotnet4.7.2
