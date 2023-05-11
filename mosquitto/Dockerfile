FROM eclipse-mosquitto:1.6

COPY docker-entrypoint.sh /

ENTRYPOINT ["sh", "./docker-entrypoint.sh"]

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
