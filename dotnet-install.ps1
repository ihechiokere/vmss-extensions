$PSVersion = "7.4.3"
$url = "https://dot.net/v1/dotnet-install.ps1"
$output = "dotnet8-install.ps1"

Invoke-WebRequest -Uri $url -OutFile $output
./dotnet8-install.ps1 -Channel LTS -InstallDir 'C:\Program Files\dotnet'
./dotnet8-install.ps1  -Channel 8.0 -Runtime windowsdesktop
./dotnet8-install.ps1  -Channel 8.0 -Runtime aspnetcore
$ProgressPreference = "silentlyContinue"; iex ((New-Object System.Net.WebClient).DownloadString('https://tools.veracode.com/veracode-cli/install.ps1'))

$PSurl = "https://github.com/PowerShell/PowerShell/releases/download/v$PSVersion/PowerShell-$PSVersion-win-x64.msi"
$output = "PowerShell-v$PSVersion-win-x64.msi"
Invoke-WebRequest -Uri $PSurl -OutFile $output -UseBasicParsing
msiexec.exe /package PowerShell-v$PSVersion-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1Start-Process pwsh.exe 
