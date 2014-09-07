### 
### Commands for querying or clearing the Redis cache
###

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$RedisFolder = (Join-Path "$ScriptPath\.." "Redis")

# Local Redis instance defaults
$_Server = "localhost"
$_Port = 6379
$_Db = 0

<#
	.SYNOPSIS
		Flush all of the databases from a given Redis cache instance.
#>
function Flush-All($Server=$_Server, $Port=$_Port)
{
	ExecuteCommandAgainstRedis $Server $Port $_Db flushall
}

<#
	.SYNOPSIS
		Flush a single DB in Redis from the cache.
#>
function Flush-Cache($Server=$_Server, $Port=$_Port, $Db=$_Db)
{
	ExecuteCommandAgainstRedis $Server $Port $Db flushdb
}

<#
	.SYNOPSIS
		Starts a local Redis cache instance on your local machine, running on port 6379 (default).
		You will still need to update the App/Web.config files to utilize this cache for testing.
#>
function Start-Cache()
{
	& "$RedisFolder\Redis-Server.exe" "$RedisFolder\redis.windows.conf"
}

<#
	.SYNOPSIS
		Installs a Redis cache instance on your local machine, running on port 6379 (default).
#>
function Install-CacheService()
{
	& "$RedisFolder\Redis-Server.exe" "--service-install"  "$RedisFolder\redis.windows.conf"
	
	& "$RedisFolder\Redis-Server.exe" "--service-start"
}

<#
	.SYNOPSIS
		Removes the Redis cache instance on your local machine.
#>
function Remove-CacheService()
{
	& "$RedisFolder\Redis-Server.exe" "--service-stop"

	& "$RedisFolder\Redis-Server.exe" "--service-uninstall"
}

<#
	.SYNOPSIS
		Starts a Windows GUI for managing Redis cache instances
#>
function Start-CacheManager()
{
	#chocolatey install redis-desktop-manager
	& "${Env:ProgramFiles(x86)}\RedisDesktopManager\redis-desktop-manager.exe"
}

<#
	.SYNOPSIS
		Search through an instance of a Redis cache for a given key pattern.
#>
function Search-CacheKeys($KeyPattern, $Server=$_Server, $Port=$_Port, $Db=$_Db)
{
	ExecuteCommandAgainstRedis $Server $Port $Db KEYS "$KeyPattern"
}

<#
	.SYNOPSIS
		Print the general Redis server info.
#>
function Get-CacheInfo($Server=$_Server, $Port=$_Port)
{
	ExecuteCommandAgainstRedis $Server $Port $_Db "info"
}

<#
	.SYNOPSIS
		Get the data stored at a particular key in Redis.
#>
function Get-Key($Key, $Server=$_Server, $Port=$_Port, $Db=$_Db)
{
	ExecuteCommandAgainstRedis $Server $Port $Db GET "$Key"
}

<#
	.SYNOPSIS
		Remove a key from the Redis cache.
#>
function Delete-Key($Key, $Server=$_Server, $Port=$_Port, $Db=$_Db)
{
	ExecuteCommandAgainstRedis $Server $Port $Db DEL "$Key"
}

function Get-PubSubChannels($Server=$_Server, $Port=$_Port)
{
	ExecuteCommandAgainstRedis $Server $Port $_Db PUBSUB CHANNELS
}

<#
	.SYNOPSIS
		Subscribe to the given Pub/Sub Redis channel and see all data posted to it.
#>
function Subscribe-PubSub($ChannelName, $Server=$_Server, $Port=$_Port)
{
	ExecuteCommandAgainstRedis $Server $Port $_Db SUBSCRIBE $ChannelName
}

<#
	.SYNOPSIS
		Dumps all of the keys in a Redis database to a json file. 
		Probably shouldn't run this against production
#>
function Read-CacheToJson($KeyPattern="*", $Server=$_Server, $Port=$_Port, $Db=$_Db)
{
	$Keys = Search-CacheKeys -KeyPattern $KeyPattern -Server $Server -Port $Port -Db $Db
	
	foreach($Key in $Keys.Split("`n"))
	{
		if([string]::IsNullOrEmpty($Key)){ break; }
	
		Get-Key -Key $Key -Server $Server -Port $Port -Db $Db | Out-File "$Key.json"
	}
}

<#
	.SYNOPSIS
		Delete all keys that match a given pattern.
		This results in N+1 connections to Redis, which means it's probably slow as hell
		and should only be used against small keyspaces.
#>
function Delete-Keys($KeyPattern, $Server=$_Server, $Port=$_Port, $Db=$_Db)
{
	$Keys = Search-CacheKeys -KeyPattern $KeyPattern -Server $Server -Port $Port -Db $Db
	
	foreach($Key in $Keys.Split("`n"))
	{
		Delete-Key $Key $Server $Port $Db
	}
}

function ExecuteCommandAgainstRedis($Server, $Port, $Db, $Command, $Params="")
{
	& "$RedisFolder\Redis-Cli.exe" -h $Server -p $Port -n $Db $Command $Params
}

Export-ModuleMember -Function  *-*