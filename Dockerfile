FROM openjdk:8-jdk-alpine
MAINTAINER wtf
EXPOSE 8086
ENV PROFILE='production'
ENV JAVA_OPTS=''
ENV APP_OPTS=''
ADD app.jar /app.jar
RUN echo "Asia/Shanghai" > /etc/timezone
COPY docker-entrypoint.sh /
ENTRYPOINT ["sh","/docker-entrypoint.sh"]
