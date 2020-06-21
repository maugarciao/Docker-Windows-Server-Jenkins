# this script downloads the installer files and copies them into the image as opposed to downloading them in the image.
# this should make the process less cumbersome when doing customizing this build.

# variables
$installer_path = 
$installer_path = "$(Get-Location)\installers\"
Write-Host "Downloading to... " + $installer_path

If (-not (Test-Path -Path $installer_path)) {
    Write-Host "Creating installer directory..."
    mkdir $installer_path
}

# objs
$wc = New-Object System.Net.WebClient

# donwload 7zip
Write-Host "Downloading 7zip..."
$wc.DownloadFile("https://www.7-zip.org/a/7z1900-x64.exe", $installer_path + "7zip-x64.exe")

# download jre
Write-Host "Please manually download the JRE SDK."
# you must log in to oracle to download jre

# download asp.net
Write-Host "Downloading ASP.NET..."
$wc.DownloadFile("https://dotnet.microsoft.com/download/dotnet-framework/thank-you/net48-developer-pack-offline-installer", $installer_path + "ndp48-devpack-enu.exe")

# download .net core
Write-Host "Downloading .NET Core..."
$wc.DownloadFile("https://dotnet.microsoft.com/download/dotnet-core/thank-you/sdk-3.1.301-windows-x64-installer", $installer_path + "dotnet-sdk-3.1.301-windows-x64-installer.exe")

# download jenkins
Write-Host "Downloading Jenkins.war..."
$wc.DownloadFile("https://updates.jenkins-ci.org/download/war/2.0/jenkins.war", $installer_path + "jenkins.war")