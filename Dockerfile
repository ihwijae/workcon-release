FROM openjdk:21-jdk
COPY build/libs/WorkConGW-0.0.1-SNAPSHOT.war app.war
CMD ["java", "-jar", "app.war"]