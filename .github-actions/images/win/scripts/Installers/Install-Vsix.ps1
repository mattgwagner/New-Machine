###################################################################################
##  File:  Install-Vsix.ps1
##  Desc:  Install the Visual Studio Extensions from toolset.json
###################################################################################

$toolset = Get-ToolsetContent
$vsixPackagesList = $toolset.visualStudio.vsix
if (-not $vsixPackagesList) {
    Write-Host "No extensions to install"
    exit 0
}

$vsVersion = $toolset.visualStudio.Version
$vsixPackagesList | ForEach-Object {
    # Retrieve cdn endpoint to avoid HTTP error 429 https://github.com/actions/virtual-environments/issues/3074
    $vsixPackage = Get-VsixExtenstionFromMarketplace -ExtensionMarketPlaceName $_
    if ($vsixPackage.FileName.EndsWith(".vsix")) {
        Install-VsixExtension -Url $vsixPackage.DownloadUri -Name $vsixPackage.FileName -VSversion $vsVersion
    } else {
        $argumentList = ('/install', '/quiet', '/norestart')
        Install-Binary -Url $vsixPackage.DownloadUri -Name $vsixPackage.FileName -ArgumentList $argumentList
    }
}

Invoke-PesterTests -TestFile "Vsix"