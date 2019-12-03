## This configuration file uses BoxStarter to configure the system
## and Chocolatey to install necessary packages

# Based on https://github.com/microsoft/azure-pipelines-image-generation/blob/master/images/win/scripts/Installers/Install-NodeLts.ps1

$PrefixPath = 'C:\npm\prefix'
$CachePath = 'C:\npm\cache'

New-Item -Path $PrefixPath -Force -ItemType Directory
New-Item -Path $CachePath -Force -ItemType Directory

choco install nodejs-lts -y --force

setx NPM_CONFIG_PREFIX $PrefixPath /M
$env:NPM_CONFIG_PREFIX = $PrefixPath

setx NPM_CONFIG_CACHE $CachePath /M
$env:NPM_CONFIG_CACHE = $CachePath

npm config set registry http://registry.npmjs.org/

npm install -g cordova
npm install -g grunt-cli
npm install -g gulp-cli
npm install -g parcel-bundler
npm install -g --save-dev webpack webpack-cli
npm install -g yarn

## Development Tools - Node.JS & Yarn

choco install nvm

nvm install latest

# choco install visualstudio2019-workload-node