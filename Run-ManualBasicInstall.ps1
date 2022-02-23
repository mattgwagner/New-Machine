$here = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

& "$Here\Install-Boxstarter.ps1"

& "$Here\Install-Common.ps1"

& "$Here\Install-DevTools.ps1"

& "$Here\Install-VsCode.ps1"