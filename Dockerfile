FROM alpine:3.14.0
LABEL AUTHOR="jagadeesh"
LABEL EMAIL="jagadeeshjaga042@gmail.com"

# install java
RUN apk add openjdk8-jre

WORKDIR /opt

# install tomcat
ADD https://downloads.apache.org/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz .

# extract tar file
RUN tar xf apache-tomcat-8.5.69.tar.gz

# remove tar file
RUN rm  apache-tomcat-8.5.69.tar.gz

# rename tomcat8 folder
RUN mv apache-tomcat-8.5.69 tomcat8

WORKDIR /opt/tomcat8/webapps/jaga

COPY index.html .

EXPOSE 8080

ENTRYPOINT [ "/opt/tomcat8/bin/catalina.sh","run" ]