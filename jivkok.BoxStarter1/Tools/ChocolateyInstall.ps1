import-module (Join-Path $env:ChocolateyInstall \chocolateyInstall\helpers\chocolateyInstaller.psm1)
$scriptPath = (Split-Path -parent $MyInvocation.MyCommand.path)
import-module $scriptPath\boxstarter.psm1

try {
    Disable-UAC

    Disable-InternetExplorerESC

    Set-ExplorerOptions -showHidenFilesFoldersDrives $true -showProtectedOSFiles $true -showFileExtensions $true

    Set-TaskbarSmall

    Enable-RemoteDesktop

    Install-WindowsUpdate

    Restart-Explorer
} 
catch {
    Write-ChocolateyFailure 'jivkok.BoxStarter1' $($_.Exception.Message)
    throw 
}
