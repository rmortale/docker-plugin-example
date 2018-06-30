FROM openjdk:8-jre

ADD target/dw*.jar app.jar
ADD config.yml config.yml

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
CMD ["server", "config.yml"]

