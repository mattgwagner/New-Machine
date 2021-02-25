Write-Output "Starting SQL Server Installs"

# choco install sql-server-express -ia "/IACCEPTSQLSERVERLICENSETERMS /Q /ACTION=install /INSTANCEID=MSSQLSERVER /INSTANCENAME=MSSQLSERVER /UPDATEENABLED=FALSE" -o -y

# Switching to SQL Server 2019 Developer Edition, which is free for all non-prod uses and doesn't limit to 10gb dbs like Express

choco install sql-server-2019

choco install sql-server-management-studio

Install-Module -Name SqlServer -Force -AllowClobber
