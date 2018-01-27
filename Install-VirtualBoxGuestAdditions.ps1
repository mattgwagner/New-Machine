# install Guest Additions.
if ((Get-WmiObject Win32_ComputerSystemProduct Vendor).Vendor -eq 'QEMU') {
    # install qemu-qa.
    $qemuAgentSetupUrl = "http://$env:PACKER_HTTP_ADDR/drivers/guest-agent/qemu-ga-x64.msi"
    $qemuAgentSetup = "$env:TEMP\qemu-ga-x64.msi"
    Write-Host "Downloading the qemu-kvm Guest Agent from $qemuAgentSetupUrl..."
    Invoke-WebRequest $qemuAgentSetupUrl -OutFile $qemuAgentSetup
    Write-Host 'Installing the qemu-kvm Guest Agent...'
    Start-Process $qemuAgentSetup /qn -Wait
} else {
    Write-Host 'Importing the Oracle (for VirtualBox) certificate as a Trusted Publisher...'
    E:\cert\VBoxCertUtil.exe add-trusted-publisher E:\cert\vbox-sha1.cer
    if ($LASTEXITCODE) {
        throw "failed to import certificate with exit code $LASTEXITCODE"
    }
    #Get-ChildItem Cert:\LocalMachine\TrustedPublisher

    Write-Host 'Installing the VirtualBox Guest Additions...'
    $p = Start-Process -Wait -NoNewWindow -PassThru -FilePath E:\VBoxWindowsAdditions-amd64.exe -ArgumentList '/S'
    $p.WaitForExit()
    if ($p.ExitCode) {
        throw "failed to install with exit code $($p.ExitCode). Check the logs at C:\Program Files\Oracle\VirtualBox Guest Additions\install.log."
    }

    Write-Host 'Ejecting the VirtualBox Guest Additions media...'
    $ejectVolumeMediaExeUrl = 'https://github.com/rgl/EjectVolumeMedia/releases/download/v1.0.0/EjectVolumeMedia.exe'
    $ejectVolumeMediaExeHash = 'f7863394085e1b3c5aa999808b012fba577b4a027804ea292abf7962e5467ba0'
    $ejectVolumeMediaExe = "$env:TEMP\EjectVolumeMedia.exe"
    Invoke-WebRequest $ejectVolumeMediaExeUrl -OutFile $ejectVolumeMediaExe
    $ejectVolumeMediaExeActualHash = (Get-FileHash $ejectVolumeMediaExe -Algorithm SHA256).Hash
    if ($ejectVolumeMediaExeActualHash -ne $ejectVolumeMediaExeHash) {
        throw "the $ejectVolumeMediaExeUrl file hash $ejectVolumeMediaExeActualHash does not match the expected $ejectVolumeMediaExeHash"
    }
    &$ejectVolumeMediaExe E
}