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

foreach($Extension in $Extensions)
{
    & "C:\Program Files\Microsoft VS Code\code.exe" --install-extension $Extension
}