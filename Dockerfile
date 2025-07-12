# Stage 1: Build the application
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM eclipse-temurin:17-jre-alpine
EXPOSE 8081
WORKDIR /app
COPY --from=build /app/target/*.jar devops-integration.jar
ENTRYPOINT ["java", "-jar", "devops-integration.jar"]


#FROM openjdk:17-jre-slim
#EXPOSE 8081
#WORKDIR /app
#COPY ../target/devops-integration.jar devops-integration.jar
#CMD ["java", "-jar", "devops-integration.jar"]