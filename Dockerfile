FROM sonarqube:lts

# Http port
EXPOSE 9000

ENTRYPOINT ["./bin/run.sh"]
