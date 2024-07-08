$url = "https://dot.net/v1/dotnet-install.ps1"
$output = "dotnet8-install.ps1"

Invoke-WebRequest -Uri $url -OutFile $output
./dotnet8-install.ps1 -Channel LTS -InstallDir 'C:\Program Files\dotnet'
./dotnet8-install.ps1  -Channel 8.0 -Runtime windowsdesktop
./dotnet8-install.ps1  -Channel 8.0 -Runtime aspnetcore
