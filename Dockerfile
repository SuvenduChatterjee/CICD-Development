FROM openjdk:17-jdk-slim
EXPOSE 8081
WORKDIR /app
COPY ../target/devops-integration.jar devops-integration.jar
CMD ["java", "-jar", "devops-integration.jar"]