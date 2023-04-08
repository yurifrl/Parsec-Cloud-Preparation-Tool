function ConvertTo-CamelCase($input) {
  return ($input -split '\s+' | ForEach-Object { $_.Substring(0, 1).ToUpper() + $_.Substring(1).ToLower() }) -join ''
}
function Install-Executable($url, $name) {
  $output = (ConvertTo-CamelCase $name) + ".exe"
  Invoke-WebRequest -Uri $url -OutFile $output
  Start-Process -FilePath $output -Wait
}

$softwareList = @(
  @{
    "Name"  = "Firefox"
    "Url"   = "https://cdn.stubdownloader.services.mozilla.com/builds/firefox-stub/pt-BR/win/793925e36c1d92460e349e7af6a5f4a708c9acb6ffea5be0fe11dcf56def58bb/Firefox%20Installer.exe" 
  },
  @{
    "Name"  = "Steam"
    "Url"   = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
  },
  @{
    "Name"  = "Parsec"
    "Url"   = "https://builds.parsec.app/package/parsec-windows.exe" 
  },
  @{
    "Name"  = "Nvidia driver"
    "Url"   = "https://download.microsoft.com/download/f/a/f/fafa2972-4975-482e-99e6-442d5ad864a1/528.24_grid_win10_win11_server2019_server2022_dch_64bit_international-Azure-swl.exe" 
  },
  @{
    "Name"  = "Virtual Audio Cable"
    "Url"   = "https://software.muzychenko.net/trials/vac467.exe" 
  },
  @{
    "Name"  = "Star Citizen"
    "Url"   = "https://install.robertsspaceindustries.com/star-citizen/RSI-Setup-1.6.5.exe" 
  },
  @{
    "Name"  = "Battle.net"
    "Url"   = "https://us.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe" 
  }
)

foreach ($software in $softwareList) {
    Write-Host "Press any key to install $($software.Name), or 's' to skip."
    $key = $Host.UI.RawUI.ReadKey("NoEcho, IncludeKeyDown").Character

    if ($key -ne 's') {
        "Installing $($software.Name)..."
        Install-Executable -url $software.Url -output $software.Name
    }
}

# Modify Registry
$modifyRegistry = Read-Host -Prompt 'Do you want to modify the Winlogon and Personalization registry key? (y/n)'
if ($modifyRegistry -eq 'y') {
  # Set DefaultUserName to 'parsec'
  $username = "your_username_here"
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultUserName" -Value $username

  # Set DefaultPassword to the desired password
  $password = "your_password_here"
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultPassword" -Value $password

  # Set AutoAdminLogon to 1
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -Value "1"

  # Create Personalization key if it does not exist
  if (-not(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization")) {
      New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Personalization" | Out-Null
  }

  # Set NoLockScreen D-word value to 1
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "NoLockScreen" -Value 1 -Type DWord
}