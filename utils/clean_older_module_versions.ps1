foreach ($Module in Get-InstalledModule) {
    Get-InstalledModule $Module.Name -AllVersions | 
    Where-Object {$_.Version -ne $Module.Version} | 
    Uninstall-Module -WhatIf
}
