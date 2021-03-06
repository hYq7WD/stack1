# Download manuals
Update-Help -Force

# Windows update
$u=Start-WUScan
Install-WUUpdates -Updates $u

Get-WindowsFeature -Name *RSAT* | Install-WindowsFeature

# Install SSH
Get-WindowsCapability -Online -Name 'OpenSSH.Server*' | Add-WindowsCapability -Online
Set-Service -Name sshd -StartupType 'Automatic'
Start-Service sshd
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

Restart-Computer -Force
