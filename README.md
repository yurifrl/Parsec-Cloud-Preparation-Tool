# Bootstrap parsec machine on azure

```powershell
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls" 
$ScriptWebArchive = "https://github.com/yurifrl/Parsec-Cloud-Preparation-Tool/archive/main.zip"  
$LocalArchivePath = "$ENV:UserProfile\Downloads\Parsec-Cloud-Preparation-Tool"  
(New-Object System.Net.WebClient).DownloadFile($ScriptWebArchive, "$LocalArchivePath.zip")  
Expand-Archive "$LocalArchivePath.zip" -DestinationPath $LocalArchivePath -Force  
CD $LocalArchivePath\Parsec-Cloud-Preparation-Tool-main\ | powershell.exe .\Setup.ps1  
```

From [Parsec-Cloud-Preparation-Tool](https://github.com/parsec-cloud/Parsec-Cloud-Preparation-Tool)

```powershell
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls" 
$ScriptWebArchive = "https://github.com/parsec-cloud/Parsec-Cloud-Preparation-Tool/archive/master.zip"  
$LocalArchivePath = "$ENV:UserProfile\Downloads\Parsec-Cloud-Preparation-Tool"  
(New-Object System.Net.WebClient).DownloadFile($ScriptWebArchive, "$LocalArchivePath.zip")  
Expand-Archive "$LocalArchivePath.zip" -DestinationPath $LocalArchivePath -Force  
CD $LocalArchivePath\Parsec-Cloud-Preparation-Tool-master\ | powershell.exe .\Loader.ps1  
```

# Guides

- [Cloud Gaming On An Azure Server Using Parsec](https://parsec.app/blog/cloud-gaming-on-an-azure-server-using-parsec-2edcd24636f8)
- [Install NVIDIA GPU drivers on N-series VMs running Windows](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/n-series-driver-setup)
- [parsec script](https://github.com/parsec-cloud/Parsec-Cloud-Preparation-Tool/tree/master)
- [Guide how to enable automatic logon](https://learn.microsoft.com/en-us/troubleshoot/windows-server/user-profiles-and-logon/turn-on-automatic-logon)

## Issues with Windows RDP

- Remove `Microsoft Hyper-V Video` from `Device Manager` > `Display Adapters`

## Nvidia drivers

[Nvidia drivers search](https://www.nvidia.com/Download/index.aspx)
[Nvidia latest driver](https://us.download.nvidia.com/tesla/528.89/528.89-data-center-tesla-desktop-win10-win11-64bit-dch-international.exe)

This are the queries for the driver search of the `Standard_NV6ads_A10_v5`
```
Product Type: Data Center / Tesla
Product Series: A10 Series
Product: A10
```

## Autologon

https://learn.microsoft.com/en-us/sysinternals/downloads/autologon