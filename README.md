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