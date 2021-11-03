# clear screen
#docker rm -f $(docker ps -aq)
#cls

#docker login

# todo: map in volume of where jenkins stores data (-v jenkins:C:/Users/ContainerAdministrator/.jenkins/)
docker run -d --name openjdktest -p 8080:8080 openjdk
#-v C:/Git/Docker-Windows-Server-Jenkins/jenkins_home:c:/jenkins

#docker run --rm -it --name jenkinsci -p 8080:8080 mrjamiebowman/jenkins-windows powershell
#docker run -it jenkinsci type C:\Users\ContainerAdministrator\.jenkins\secrets\initialAdminPassword

start http://localhost:8080
