FROM maven AS build

WORKDIR /app

COPY . .

RUN mvn clean install

FROM openjdk:17-jdk-slim

COPY --from=build /app/target/*.jar ./app.jar
EXPOSE 9090

CMD ["java", "-jar", "app.jar"]
