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
    "Name"  = "Steam"
    "Url"   = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" 
  },
  @{
    "Name"  = "Battle.net"
    "Url"   = "https://us.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe" 
  },
  @{
    "Name"  = "Firefox"
    "Url"   = "https://cdn.stubdownloader.services.mozilla.com/builds/firefox-stub/pt-BR/win/793925e36c1d92460e349e7af6a5f4a708c9acb6ffea5be0fe11dcf56def58bb/Firefox%20Installer.exe" 
  }
)

foreach ($software in $softwareList) {
  $installSoftware = Read-Host -Prompt ('Do you want to install {0}? (y/n)' -f $software.Name)
  if ($installSoftware -eq 'y') {
    Install-Executable -url $software.Url -output $software.Output
  }
}

# Modify Registry
$modifyRegistry = Read-Host -Prompt 'Do you want to modify the Winlogon and Personalization registry key? (y/n)'
if ($modifyRegistry -eq 'y') {
  # Modify the 'Winlogon' registry key
  $WinlogonPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
  $WinlogonPropertyName = "YourPropertyName" # Replace with the actual property name
  $WinlogonPropertyValue = "YourValue" # Replace with the actual value you want to set
  Set-ItemProperty -Path $WinlogonPath -Name $WinlogonPropertyName -Value $WinlogonPropertyValue

  # Modify the 'Personalization' registry key
  $PersonalizationPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
  $PersonalizationPropertyName = "YourPropertyName" # Replace with the actual property name
  $PersonalizationPropertyValue = "YourValue" # Replace with the actual value you want to set
  Set-ItemProperty -Path $PersonalizationPath -Name $PersonalizationPropertyName -Value $PersonalizationPropertyValue
}