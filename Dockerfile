FROM sonarqube:lts

COPY ./rules/*.xml $SONARQUBE_HOME/rules/
COPY *.sh $SONARQUBE_HOME/bin/

RUN chmod 777 $SONARQUBE_HOME/bin/start.sh && \
    chmod 777 $SONARQUBE_HOME/bin/setup.sh && \
	chmod 777 $SONARQUBE_HOME/logs && \
	chmod 777 $SONARQUBE_HOME/temp

# Http port
EXPOSE 9000

# Volumes
VOLUME ["$SONARQUBE_HOME", "$SONARQUBE_HOME/conf"]

ENTRYPOINT ["./bin/start.sh"]


