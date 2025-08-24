# Use uma imagem oficial do OpenJDK
FROM openjdk:17-jdk-slim

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie o arquivo JAR da aplicação para o container
COPY target/*.jar app.jar

# Exponha a porta que será usada pelo serviço
EXPOSE 8761

# Variáveis de ambiente padrão
ENV SERVER_PORT=8761
ENV SPRING_APPLICATION_NAME=voting-system-discovery
ENV EUREKA_CLIENT_REGISTER-WITH-EUREKA=false
ENV EUREKA_CLIENT_FETCH-REGISTRY=false
ENV EUREKA_SERVER_WAIT-TIME-IN-MS-WHEN-SYNC-EMPTY=0
ENV LOGGING_LEVEL_COM_NETFLIX_DISCOVERY=INFO
ENV LOGGING_LEVEL_COM_NETFLIX_EUREKA=INFO

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]