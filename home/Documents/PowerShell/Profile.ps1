. $HOME\Documents\WindowsPowerShell\Profile.ps1

function Edit-ProfilePS7 {
    & code --reuse-window $HOME\Documents\PowerShell\Profile.ps1
}
Set-Alias "ep7" -Value "Edit-ProfilePS7"
