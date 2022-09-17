$ErrorActionPreference = "Stop"
$WarningPreference = "SilentlyContinue"

function Initialize-PModule {
    param (
        $Name
    )
    $commonOpts = @{
        Confirm=$false
        #Verbose=$true
        Force=$true
    }
    Install-Module -Name $Name @commonOpts
}

function Import-PModule {
    param (
        $Name
    )

    $commonOpts = @{
        #Verbose=$true
        Force=$true
    }

    try {
        Import-Module -Name $Name @commonOpts
    }
    catch {
        Initialize-PModule -Name $Name
        Import-Module -Name $Name @commonOpts
    }
}

#$modules = "PowerShellGet","xPSDesiredStateConfiguration","Pester","PSScriptAnalyzer","Octoposh","dbatools","PSmRemoteNG"
#$modules = "Pester","PSScriptAnalyzer","Octoposh","dbatools"
$modules = "Pester","PSScriptAnalyzer","Octoposh"
$modules.ForEach({ Import-PModule $_ })

function Edit-Profile {
    & code --reuse-window C:\Users\SergioGalceran\Documents\WindowsPowerShell\profile.ps1
}
Set-Alias 'ep' -Value 'Edit-Profile'

function Edit-mRemoteNGConfig {
    & code --reuse-window C:\Users\SergioGalceran\home\workd\scripts\powershell\utils\Create-mRemoteNGConfigFile.ps1
}
Set-Alias 'eng' -Value 'Edit-mRemoteNGConfig'

function Update-mRemoteNGConfig {
    & C:\Users\SergioGalceran\home\workd\scripts\powershell\utils\Create-mRemoteNGConfigFile.ps1 -ExportPath C:\Users\SergioGalceran\tools\CCMP-RemoteConnections.xml
}


#Export Bitwarden Session
#$env:BW_SESSION=$(bw unlock --raw)
#bw sync

Set-Location -Path "$HOME\home\workd"

#[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12