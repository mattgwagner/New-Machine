param(
    $Alias = ".\ss2012",
    # Update as required. Change the port number if using a static custom port. If using a dynamic custom port, then remove the comma and port number - ,1433.
    $Server = "localhost\sqlexpress"
)
 
# This script creates a 64bit and 32bit SQL Alias on the server. Run this script on all servers in your SharePoint farm.

Write-Host “Creating x64 SQL Alias”

New-Item -path HKLM:SOFTWARE\Microsoft\MSSQLServer\Client\ConnectTo

New-ItemProperty HKLM:SOFTWARE\Microsoft\MSSQLServer\Client\ConnectTo -name $Alias -propertytype String -value "DBMSSOCN,$Server"

Write-Host “Creating 32bit SQL Alias”

New-Item -path HKLM:SOFTWARE\Wow6432Node\Microsoft\MSSQLServer\Client\ConnectTo

Write-Host "Configured SQL Alias on the Server"

New-ItemProperty HKLM:SOFTWARE\Wow6432Node\Microsoft\MSSQLServer\Client\ConnectTo -name $Alias -propertytype String -value "DBMSSOCN,$Server"
