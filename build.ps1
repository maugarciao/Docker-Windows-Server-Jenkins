cls

# download installer files
Write-Host "Executing Download Installers Script..."
./downloadfiles.ps1

# build docker image
Write-Host "Building Docker Image..."
docker build -t maugarciao/jenkins-windows .
# --no-cache