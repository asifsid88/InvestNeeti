echo 'Building and packaging InvestNeeti WebApp'
mvn clean compile package install

echo 'Stopping tomcat server'
sh /usr/local/Cellar/tomcat/8.5.11/libexec/bin/shutdown.sh

echo 'Moving deployable war file to tomcat server'
cp target/InvestNeeti.war /usr/local/Cellar/tomcat/8.5.11/libexec/webapps

echo 'Starting tomcat server'
sh /usr/local/Cellar/tomcat/8.5.11/libexec/bin/startup.sh

echo 'Hit: http://localhost:8080/InvestNeeti/'