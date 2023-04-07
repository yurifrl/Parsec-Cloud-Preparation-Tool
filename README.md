# Run Star Citizen on Azure

```powershell
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls" 
$ScriptWebArchive = "https://github.com/yuriflr/til/archive/main.zip"  
$LocalArchivePath = "$ENV:UserProfile\Downloads\BoostrapScript"  
(New-Object System.Net.WebClient).DownloadFile($ScriptWebArchive, "$LocalArchivePath.zip")  
Expand-Archive "$LocalArchivePath.zip" -DestinationPath $LocalArchivePath -Force  
CD $LocalArchivePath\til-main\ | powershell.exe .\cloudgaming\scripts.ps1   
```

# Guides
- [Cloud Gaming On An Azure Server Using Parsec](https://parsec.app/blog/cloud-gaming-on-an-azure-server-using-parsec-2edcd24636f8)
- [Install NVIDIA GPU drivers on N-series VMs running Windows](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/n-series-driver-setup)
- [parsec script](https://github.com/parsec-cloud/Parsec-Cloud-Preparation-Tool/tree/master)

# Downloads

- [parsec](https://builds.parsec.app/package/parsec-windows.exe)
- [nvidia driver](https://download.microsoft.com/download/f/a/f/fafa2972-4975-482e-99e6-442d5ad864a1/528.24_grid_win10_win11_server2019_server2022_dch_64bit_international-Azure-swl.exe)
- [Virtual Audio Cable](https://software.muzychenko.net/trials/vac467.exe)
- [Start citizen](https://install.robertsspaceindustries.com/star-citizen/RSI-Setup-1.6.5.exe)


# Winlogon and noPassword something

[Guide how to enable automatic logon](https://learn.microsoft.com/en-us/troubleshoot/windows-server/user-profiles-and-logon/turn-on-automatic-logon)

```powershell
regedit

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon 1
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization 1
```

## Issues with Windows RDP

[parsec guide on dealing with rdp issues](https://support.parsec.app/hc/en-us/articles/360002165172)

- Navigate to Local `Computer Policy > Computer Configuration > Administrative Templates > Windows Components > Remote Desktop Services > Remote Desktop Session Host > Remote Session Environment`
- Set "Use WDDM graphics display driver..." to "Disabled"