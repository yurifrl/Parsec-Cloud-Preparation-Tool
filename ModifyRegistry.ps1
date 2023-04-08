# Set AutoAdminLogon to 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -Value "1"

# Create Personalization key if it does not exist
if (-not(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Personalization" | Out-Null
}

# Set NoLockScreen D-word value to 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "NoLockScreen" -Value 1 -Type DWord

# Set DefaultUserName to 'parsec'
$username = "parsec"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultUserName" -Value $username

# Set DefaultPassword to the desired password
$password = Read-Host -Prompt 'password: ' -AsSecureString
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultPassword" -Value $password
