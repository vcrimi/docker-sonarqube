FROM sonarqube:lts

chmod 777 /opt/sonarqube/temp
chmod 777 /opt/sonarqube/logs

VOLUME /opt/sonarqube/

# Http port
EXPOSE 9000

ENTRYPOINT ["./bin/run.sh"]
