$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

function Init-GitSubmodules()
{
	git submodule update --init --recursive
}

function Get-LatestCode()
{
	git stash
	git pull --rebase origin
	git stash pop
}
Set-Alias gitp Get-LatestCode -Scope Global

$PoshGitPath = (Join-Path $ScriptPath "posh-git")

Import-Module $PoshGitPath -Scope Global

& "$PoshGitPath\profile.example.ps1"