$PSVersion = "7.4.4"
$url = "https://dot.net/v1/dotnet-install.ps1"
$output = "dotnet8-install.ps1"
$ProgressPreference = "silentlyContinue"; iex ((New-Object System.Net.WebClient).DownloadString('https://tools.veracode.com/veracode-cli/install.ps1'))
$PSurl = "https://github.com/PowerShell/PowerShell/releases/download/v$PSVersion/PowerShell-$PSVersion-win-x64.msi"
$PSoutput = "PowerShell-v$PSVersion-win-x64.msi"
$JavaUrl = "https://cfdownload.adobe.com/pub/adobe/coldfusion/java/java8/java8u391/jdk/jdk-8u391-windows-x64.exe"
$JavaOutput = "jdk-8u391-windows-x64.exe"
Invoke-WebRequest -Uri $url -OutFile $output
./dotnet8-install.ps1 -Channel LTS -InstallDir 'C:\Program Files\dotnet'
./dotnet8-install.ps1  -Channel 8.0 -Runtime windowsdesktop
./dotnet8-install.ps1  -Channel 8.0 -Runtime aspnetcore
Invoke-WebRequest -Uri $PSurl -OutFile $PSoutput -UseBasicParsing
msiexec.exe /package PowerShell-v$PSVersion-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1
sleep 120
Invoke-WebRequest -Uri $JavaUrl -OutFile $JavaOutput -UseBasicParsing
.\jdk-8u391-windows-x64.exe /s   
sleep 120
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Script -Name winget-install -RequiredVersion 2.1.0 -Force 
