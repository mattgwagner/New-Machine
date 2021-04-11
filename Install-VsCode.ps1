###
### Install Visual Studio Code via Chocolatey and my preferred extensions
###

$Extensions = @(
    'ms-dotnettools.csharp',
    'ms-vscode.powershell',
    'ms-azuretools.vscode-docker',
    'eamodio.gitlens',
    'ms-mssql.mssql',
    'esbenp.prettier-vscode',
    'ms-azuretools.vscode-cosmosdb'
)

choco install vscode

foreach($Extension in $Extensions)
{
    Write-Output "Installing VSCode Extension $Extension"

    & "C:\Program Files\Microsoft VS Code\bin\code.cmd" --install-extension $Extension
}
