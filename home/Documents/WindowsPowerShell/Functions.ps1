function Initialize-PModule {
    param (
        $Name
    )
    $commonOpts = @{
        Confirm=$false
        Force=$true
        #Verbose=$true
    }
    Install-Module -Name $Name @commonOpts
}

function Import-PModule {
    param (
        $Name
    )
    $commonOpts = @{
        Force=$true
        #Verbose=$true
    }

    try {
        Import-Module -Name $Name @commonOpts
    }
    catch {
        Initialize-PModule -Name $Name
        Import-Module -Name $Name @commonOpts
    }
}

function Initialize-BWStore {
    try {
        #Export BW Session
        $env:BW_SESSION=$(bw unlock --raw)
        Write-Output "Running bw sync... $(bw sync)"
    }
    catch {
        Write-Output "Failed to unlock or sync bitwarden... Try again later."
    }
}

function Edit-PSProfile {
    & code --reuse-window $HOME\Documents\WindowsPowerShell\Profile.ps1
}

function Edit-mRemoteNGConfig {
    & code --reuse-window C:\Users\SergioGalceran\home\workd\scripts\powershell\utils\Create-mRemoteNGConfigFile.ps1
}
Set-Alias 'eng' -Value 'Edit-mRemoteNGConfig'

function Update-mRemoteNGConfig {
    & C:\Users\SergioGalceran\home\workd\scripts\powershell\utils\Create-mRemoteNGConfigFile.ps1 -ExportPath C:\Users\SergioGalceran\tools\CCMP-RemoteConnections.xml
}