FROM sonarqube:lts

COPY ./rules/*.xml /opt/sonarqube/rules/
COPY *.sh /opt/sonarqube/bin/

RUN chmod 777 /opt/sonarqube/bin/start.sh && \
    chmod 777 /opt/sonarqube/bin/setup.sh && \
	chmod 777 /opt/sonarqube/logs && \
	chmod 777 /opt/sonarqube/temp

# Http port
EXPOSE 9000

# Volumes
VOLUME /opt/sonarqube/
VOLUME /opt/sonarqube/conf


ENTRYPOINT ["./bin/start.sh"]


