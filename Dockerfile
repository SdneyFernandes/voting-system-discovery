# Estágio 1: Build da aplicação
FROM maven:3.8.6-openjdk-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Estágio 2: Imagem final
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8761

ENV SERVER_PORT=8761
ENV SPRING_APPLICATION_NAME=voting-system-discovery
ENV EUREKA_CLIENT_REGISTER_WITH_EUREKA=false
ENV EUREKA_CLIENT_FETCH_REGISTRY=false
ENV EUREKA_SERVER_WAIT_TIME_IN_MS_WHEN_SYNC_EMPTY=0
ENV LOGGING_LEVEL_COM_NETFLIX_DISCOVERY=INFO
ENV LOGGING_LEVEL_COM_NETFLIX_EUREKA=INFO

ENTRYPOINT ["java", "-jar", "app.jar"]