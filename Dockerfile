FROM mcr.microsoft.com/windows/servercore:1809-amd64
LABEL maintainer="@mrjamiebowman"

#SHELL ["powershell"]

WORKDIR /

# set up dirs
RUN mkdir C:\setup
RUN mkdir C:\jenkins
RUN mkdir C:\Java\jre1.8.0_202\bin

# paths
RUN SetX PATH "%path%;C:\Program Files\7-zip;C:\Java\jre1.8.0_202\bin"
RUN SetX JAVA_HOME 'C:\Java\jre1.8.0_202'

# set working directory
WORKDIR /setup

# 7zip
COPY installers/7z1602-x64.exe /setup/
RUN powershell -Command "Start-Process -Wait -FilePath 'C:\setup\7z1602-x64.exe' -ArgumentList '/S'"

# install jre 8
WORKDIR /Java/
COPY installers/jre-8u202-windows-x64.tar.gz /Java/
RUN 7z.exe e jre-8u202-windows-x64.tar.gz -y
RUN 7z.exe x jre-8u202-windows-x64.tar -y

# install chocolatey
RUN powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

# install apps
WORKDIR /setup

# install asp.net 4.8 developer pack
COPY installers/ndp48-devpack-enu.exe /setup/
RUN ndp48-devpack-enu.exe /q /install

# install .net core 3.1
COPY installers/dotnet-sdk-3.1.301-win-x64.exe /setup/
RUN dotnet-sdk-3.1.301-win-x64.exe /q /install

# set up jenkins
ENV HOME /jenkins
ENV JENKINS_VERSION 2.0
RUN powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://updates.jenkins-ci.org/download/war/2.0/jenkins.war', '/jenkins/jenkins.war');"

EXPOSE 8080
EXPOSE 50000

# entrypoint
COPY entrypoint.bat /setup/

ENTRYPOINT /setup/entrypoint.bat