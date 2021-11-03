# this script downloads the installer files and copies them into the image as opposed to downloading them in the image.
# this should make the process less cumbersome when doing customizing this build.

# variables
$installer_path = 
$installer_path = "$(Get-Location)\installers\"
Write-Host "Downloading to... " + $installer_path

# create installers folder
If (-not (Test-Path -Path $installer_path)) {
    Write-Host "Creating installer directory..."
    mkdir $installer_path
}

# create jenkins folder
If (-not (Test-Path -Path "$(Get-Location)\jenkins\")) {
    Write-Host "Creating jenkins directory..."
    mkdir "$(Get-Location)\jenkins\"
}

# objs
$wc = New-Object System.Net.WebClient

# download 7zip
Write-Host "Downloading 7zip..."
If(-not (Test-Path  -Path ($installer_path + "\installers\7zip-x64.exe")))
{
$wc.DownloadFile("https://www.7-zip.org/a/7z1900-x64.exe", $installer_path + "7zip-x64.exe")
}
gci $installer_path\7zip-x64.exe
# download OpenJDK 11
If(-not (Test-Path -Path ($installer_path + "./microsoft-jdk-11.0.12.7.1-windows-x64.msi")))
{
Write-Host "Downloading Microsoft OpenJDK MSI version..."
$wc.DownloadFile("https://aka.ms/download-jdk/microsoft-jdk-11.0.12.7.1-windows-x64.msi", $installer_path + "microsoft-jdk-11.0.12.7.1-windows-x64.msi")
}
gci $installer_path\microsoft-jdk-11.0.12.7.1-windows-x64.msi
# download asp.net
If(-not (Test-Path -Path ($installer_path + "./ndp48-devpack-enu.exe")))
{
Write-Host "Downloading ASP.NET..."
$wc.DownloadFile("https://go.microsoft.com/fwlink/?linkid=2088517", $installer_path + "ndp48-devpack-enu.exe")
}
gci $installer_path\ndp48-devpack-enu.exe
# download .net core 3.1
Write-Host "Downloading .NET Core 3.1..."
If(-not (Test-Path -Path ($installer_path + "./dotnet-sdk-3.1.407-win-x64.exe")))
{
$wc.DownloadFile("https://download.visualstudio.microsoft.com/download/pr/a45c8c1c-6466-4afc-a266-bd540069a4a6/97293f1080615bba5572ad1ef3be254c/dotnet-sdk-3.1.407-win-x64.exe
", $installer_path + "dotnet-sdk-3.1.407-win-x64.exe")
}
gci $installer_path\dotnet-sdk-3.1.407-win-x64.exe
# download .net core 5.0
Write-Host "Downloading .NET Core 5.0.401..."
If(-not (Test-Path -Path ($installer_path + "./dotnet-sdk-5.0.401-win-x64.exe")))
{
$wc.DownloadFile("https://download.visualstudio.microsoft.com/download/pr/aa5eedba-8906-4e2b-96f8-1b4f06187460/e6757becd35f67b0897bcdda44baec93/dotnet-sdk-5.0.401-win-x64.exe
", $installer_path + "dotnet-sdk-5.0.401-win-x64.exe")
}
gci $installer_path\dotnet-sdk-5.0.401-win-x64.exe
# download PowerShell 7.1.4
Write-Host "Downloading PowerShell 7.1.4..."
If(-not (Test-Path -Path ($installer_path + "./PowerShell-7.1.4-win-x64.msi")))
{
$wc.DownloadFile("https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/PowerShell-7.1.4-win-x64.msi
", $installer_path + "PowerShell-7.1.4-win-x64.msi")
}
gci $installer_path\PowerShell-7.1.4-win-x64.msi
# download jenkins
Write-Host "Downloading Jenkins.war..."
If(-not (Test-Path -Path ($installer_path + "./jenkins.war")))
{
$wc.DownloadFile("https://updates.jenkins-ci.org/latest/jenkins.war  ", $installer_path + "jenkins.war")
}
gci $installer_path\jenkins.war
# download jenkins windows installer
Write-Host "Downloading Jenkins windows installer v2.313..."
If(-not (Test-Path -Path ($installer_path + "./jenkins.msi")))
{
$wc.DownloadFile("https://get.jenkins.io/windows/2.313/jenkins.msi", $installer_path + "jenkins.msi")
}
gci $installer_path\jenkins.msi

#download jreJRE8 jre-8u291
Write-Host "Downloading Java JRE-8u291..."
If(-not (Test-Path -Path ($installer_path + "./jre-8u291-windows-i586.exe")))
{
$wc.DownloadFile("https://javadl.oracle.com/webapps/download/AutoDL?BundleId=244554_d7fc238d0cbf4b0dac67be84580cfb4b", $installer_path + "jre-8u291-windows-i586.exe")
}
gci $installer_path\jre-8u291-windows-i586.exe

#download offline chocolatey
Write-Host "Downloading offline chocolatey..."
If(-not (Test-Path -Path ($installer_path + "./chocolatey.0.11.3.nupkg")))
{
$wc.DownloadFile("https://community.chocolatey.org/api/v2/package/chocolatey", $installer_path + "chocolatey.0.11.3.nupkg")
}
gci $installer_path\chocolatey.0.11.3.nupkg


pause
#>