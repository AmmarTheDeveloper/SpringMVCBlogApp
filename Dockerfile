# Stage 1: Build with Maven
FROM maven:3.9.4-eclipse-temurin-17 AS build

WORKDIR /app

# Copy pom.xml and download dependencies first (caching)
COPY pom.xml .
RUN mvn dependency:go-offline -B


# Copy source code and build
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run on Tomcat 10.1
FROM tomcat:10.1.14-jdk17-temurin

# Set working directory
WORKDIR /usr/local/tomcat

# Copy built WAR into Tomcat's webapps
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Create uploads directory inside container
RUN mkdir -p ./webapps/uploads

# Expose Tomcat port
EXPOSE 8080

CMD ["bin/catalina.sh", "run"]
