# Bash for windows
$features = choco list --source windowsfeatures
if ($features | Where-Object {$_ -like "*Linux*"})
{
  choco install Microsoft-Windows-Subsystem-Linux           --source windowsfeatures --limitoutput
}

# windows containers
Enable-WindowsOptionalFeature -Online -FeatureName containers -All

# hyper-v (required for windows containers)
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
