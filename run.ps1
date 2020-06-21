# clear screen
#docker rm -f $(docker ps -aq)
cls

docker login

# todo: map in volume of where jenkins stores data
docker run -d --name jenkinsci -v jenkins:C:/Users/ContainerAdministrator/.jenkins -p 8080:8080 mrjamiebowman/jenkins-windows

#docker run --rm -it --name jenkinsci -p 8080:8080 mrjamiebowman/jenkins-windows powershell
#docker run -it jenkinsci type C:\Users\ContainerAdministrator\.jenkins\secrets\initialAdminPassword

start http://localhost:8080
