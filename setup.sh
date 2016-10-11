#!/bin/bash
export RETRY=0;
echo "10.168.11.51 devcenter" >> /etc/hosts ;
if [ ! -f /opt/sonarqube/data/.import_done ];
then
    echo "loading extensions..."
	#rm -rf /opt/sonarqube/extensions/plugins/sonar-ldap-plugin-*.jar 
	#wget -O /opt/sonarqube/extensions/plugins/sonar-ldap-plugin-1.5.1.jar   https://sonarsource.bintray.com/Distribution/sonar-ldap-plugin/sonar-ldap-plugin-1.5.1.jar
	rm -rf /opt/sonarqube/extensions/plugins/sonar-findbugs-plugin-*.jar 
	wget -O /opt/sonarqube/extensions/plugins/sonar-findbugs-plugin-3.3.jar https://sonarsource.bintray.com/Distribution/sonar-findbugs-plugin/sonar-findbugs-plugin-3.3.jar
	rm -rf /opt/sonarqube/extensions/plugins/sonar-java-plugin-*.jar 
	wget -O /opt/sonarqube/extensions/plugins/sonar-java-plugin-3.13.1.jar     https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-3.13.1.jar
	
	echo "importing // rules"
	cd /opt/sonarqube/rules
	while (! curl --silent --user admin:admin http://localhost:9000/api/qualityprofiles/restore) && (("$RETRY" < 10)); do sleep 5; let RETRY=RETRY+1; done ; \
	for filename in *.xml; do curl --user admin:admin 'http://localhost:9000/api/qualityprofiles/restore' -X POST -F "backup=@$filename";	sleep 10; done; \
	echo "[-------------- Setup done. ---------------]" ; \
	touch /opt/sonarqube/data/.import_done
else
    echo "[----- Setup already done! Exeting... -----]" && exit 0
fi
