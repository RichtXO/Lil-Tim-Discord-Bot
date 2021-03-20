FROM gradle:jdk15 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM openjdk:15.0.2-slim-buster
COPY --from=build /home/gradle/src/build/libs/*.jar /tmp/Lil-Tim.jar
WORKDIR /tmp
ENTRYPOINT ["java","-jar","/tmp/Lil-Tim.jar"]