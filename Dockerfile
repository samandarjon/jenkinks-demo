FROM openjdk:11.0.11-jre-slim
EXPOSE 8081
ADD target/app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]