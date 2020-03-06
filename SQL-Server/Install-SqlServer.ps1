Write-Output "Starting SQL Server Installs"

choco install sql-server-express -ia "/IACCEPTSQLSERVERLICENSETERMS /Q /ACTION=install /INSTANCEID=MSSQLSERVER /INSTANCENAME=MSSQLSERVER /UPDATEENABLED=FALSE" -o -y

choco install sql-server-management-studio

choco install azure-data-studio

Install-Module -Name SqlServer -Confirm
