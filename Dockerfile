FROM openjdk:11
EXPOSE 2000
ADD target/Spring-app.jar Spring-app.jar
ENTRYPOINT ["java","-jar","/Spring-app.jar"]
