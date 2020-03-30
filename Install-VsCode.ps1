###
### Install Visual Studio Code via Chocolatey and my preferred extensions
###

$Extensions = @(
    'ms-dotnettools.csharp',
    'ms-vscode.powershell',
    'ms-azuretools.vscode-docker',
    'eamodio.gitlens',
    'ms-mssql.mssql',
    'esbenp.prettier-vscode'
)

choco install vscode

RefreshEnv

foreach($Extension in $Extensions)
{
    code --install-extension $Extension
}