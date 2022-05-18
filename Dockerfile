FROM openjdk:11
COPY target/*.jar cards-gateway.jar
RUN echo "America/Fortaleza" > /etc/timezone
#ENTRYPOINT ["java", "-jar","/cards-gateway.jar"]
ENTRYPOINT ["java", "-DLOCAL_IP=192.168.1.7", "-jar","/cards-gateway.jar"]

#docker build --tag=cards-gateway:latest . <- dont forget the dot
#docker run --name cards-gateway -e "SPRING_PROFILES_ACTIVE=prod"  -p8083:8083 cards-gateway:latest
#mvn -DLOCAL_IP=192.168.1.7 clean package
