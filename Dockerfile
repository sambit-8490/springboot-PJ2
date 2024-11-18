FROM maven:3.8.3-openjdk-17 as build


# Set working directory
WORKDIR /app

# Copy source code from local to container
COPY . .

# Build application and skip test cases
RUN mvn clean install -DskipTests=true

#--------------------------------------
# Stage 2
#--------------------------------------

# Import small size java image
FROM openjdk:17-alpine

# Copy build from stage 1 (builder)
COPY --from=build /app/target/*.jar app.jar

# Expose application port 
EXPOSE 9090
CMD ["java", "-jar", "app.jar"]

