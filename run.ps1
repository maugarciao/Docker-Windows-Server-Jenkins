# clear screen
docker rm -f $(docker ps -aq)
cls

docker login

docker run -d --name jenkinsci -p 8080:8080 mrjamiebowman/jenkins-windows

#docker run --rm -it --name jenkinsci -p 8080:8080 mrjamiebowman/jenkins-windows powershell

#docker run -it jenkinsci type C:\Users\ContainerAdministrator\.jenkins\secrets\initialAdminPassword

#start https://localhost:8080

docker ps -a