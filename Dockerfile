FROM openjdk:11
EXPOSE 80
ADD target/Spring-app.jar Spring-app.jar
ENTRYPOINT ["java","-jar","/Spring-app.jar"]
