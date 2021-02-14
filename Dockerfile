FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/AurimasSk/docker-kubernetes-hello-world.git

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/docker-kubernetes-hello-world /app
RUN mvn clean package

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/*.jar /app

CMD ["java","-jar","docker-kubernetes-hello-world.jar"]
