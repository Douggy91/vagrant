FROM gradle:8.5.0-jdk17 as build_base

WORKDIR /build

COPY build.gradle.kts settings.gradle.kts /build/
RUN gradle bootJar -x test --parallel --continue > /dev/null 2>&1 || true

COPY . /build
RUN gradle bootJar -x test --parallel

FROM openjdk:17-alpine as run_base

USER root

ENV TZ=Asia/Seoul
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

RUN mkdir -p /logs /app && \
    adduser -D appuser -h /app && \
    chown -R appuser:appuser /logs /app

WORKDIR /app

COPY --from=build_base /build/build/libs/*-SNAPSHOT.jar app.jar
COPY --from=build_base /build/src/main/resources/application.yaml application.yaml
RUN chown -R appuser:appuser /app/*

RUN ls -l /app/

USER appuser

ENTRYPOINT ["java", "-Dspring.config.location=/app/application.yaml", "-jar", "/app/app.jar"]