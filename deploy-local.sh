#!/bin/bash
echo 'Building and packaging InvestNeeti WebApp'
mvn package


echo 'Stopping tomcat'
touch temp.txt
lsof -n -i4TCP:8080 > temp.txt
tomcatProcess=`sed -n '2p' temp.txt`
tomcatProcessId=$(echo $tomcatProcess | awk '{print $2}')
if [[ -n $tomcatProcessId ]]
then
    echo 'Tomcat running with PID='$tomcatProcessId
    kill -9 $tomcatProcessId
    echo 'Tomcat running at 8080 is stopped.'
else
    echo 'Your tomcat is already stopped.'
fi


echo 'Run InvestNeeti webapp'
java -jar target/dependency/webapp-runner.jar target/InvestNeeti.war

echo 'Webapp running on: http://localhost:8080/'