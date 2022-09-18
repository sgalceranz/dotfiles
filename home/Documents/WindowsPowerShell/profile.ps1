$ErrorActionPreference = "Stop"
$WarningPreference = "SilentlyContinue"

$PATH = Split-Path $($MyInvocation.MyCommand.Path) -Parent

. $PATH\Functions.ps1
. $PATH\Aliases.ps1

Initialize-BWStore

$modules = "Pester","PSScriptAnalyzer"
$modules.ForEach({ Import-PModule $_ })

#$modules = "PowerShellGet","xPSDesiredStateConfiguration","Pester","PSScriptAnalyzer","Octoposh","dbatools","PSmRemoteNG"
#$modules = "Pester","PSScriptAnalyzer","Octoposh","dbatools"
#$modules = "Pester","PSScriptAnalyzer","Octoposh"
#$modules.ForEach({ Import-PModule $_ })

$env:EDITOR = "code --wait"

Set-Location -Path "$HOME\home"
