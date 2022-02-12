FROM openjdk:11
COPY target/API-Gateway-0.0.1-SNAPSHOT.jar API-Gateway.jar
RUN echo "America/Fortaleza" > /etc/timezone
ENTRYPOINT ["java", "-DLOCAL_IP=192.168.1.7", "-jar","/API-Gateway.jar"]

#docker build --tag=yugioh-apigateway:latest . <- dont forget the dot
#docker run --name yugioh-apigateway  -p8082:8082 yugioh-apigateway:latest
#mvn -DLOCAL_IP=192.168.1.7 clean package
