# Powershell
Update-Help -Force

# Windows update
$u=Start-WUScan
Install-WUUpdates -Updates $u

Get-WindowsFeature -Name *RSAT* | Install-WindowsFeature

# SSH
Set-Service -Name sshd -StartupType 'Automatic'
Get-NetFirewallRule -Name *ssh*
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

Restart-Computer -Force
