# Docker Windows Server Core Jenkins
DevOps Dockerized Windows Server Core with Jenkins, ASP.NET 4.8, .NET Core 3.1

#### Blog Post
[mrjamiebowman.com](https://www.mrjamiebowman.com)

# Installer Files
I thought about this and decided it was best to run a PowerShell script before hand that downloads the installer files. Why did I do it this way? Had I done the download in the Dockerfile using PowerShell, it would have had to download all of those installers every time this image is re-created. You also have to log into Oracle to download the JRE SDK files. Rebuilding and customizing this image will be easier by mapping in the installer files since they are so large.

# Getting Started. Building the Image
the "build.ps1" is a PowerShell script that downloads the installers and runs the Docker build command.

# Run the Container
You may need to run docker login before you start.

#### Downloading the Installer Files
Running the downloadfiles.ps1 will download most of the files used to install and configure the build server. You will need to login to the Oracle website and download the JRE SDK in a tar.gz file format.

`./downloadfiles.ps1`

#### Starting Build Server

After you've built the image, you can create a container by runing the "run.ps1" PowerShell script.

`./run.ps1`

#### Initial Administrative Password
The initial password is in the logs of the docker container or you can use either one of these commands to get it.

`docker logs jenkinsci`

`docker run -it jenkinsci type C:\Users\ContainerAdministrator\.jenkins\secrets\initialAdminPassword`

#### Removing Container
`docker rm -f jenkinsci`