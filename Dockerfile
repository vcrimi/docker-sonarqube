FROM sonarqube:lts

RUN chmod 777 /opt/sonarqube/temp
RUN chmod 777 /opt/sonarqube/logs

VOLUME /opt/sonarqube/
VOLUME /opt/sonarqube/conf

COPY setup.sh ./bin/setup.sh
COPY start.sh ./bin/start.sh
COPY ./rules/*.xml /opt/sonarqube/rules/

# Http port
EXPOSE 9000

CMD "./bin/start.sh"


