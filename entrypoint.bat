setx -m JAVA_HOME "C:\java\"
echo %JAVA_HOME%
java -jar C:\jenkins\jenkins.war
ping -t localhost