param (
	[string]$packages = $(throw "packages is required")
)

Import-Module .\Functions

chocolatey install "$packages.config"