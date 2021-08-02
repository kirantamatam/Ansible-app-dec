FROM alpine:3.14.0
LABEL AUTHOR="jagadeesh"
LABEL EMAIL="jagadeeshjaga042@gmail.com"

# install java
RUN apk add openjdk8-jre

# install tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz

# extract tar file
RUN tar xf apache-tomcat-8.5.69.tar.gz

# rename tomcat8 folder
RUN mv apache-tomcat-8.5.69 tomcat8

# put static website on tomcat8
RUN mkdir tomcat8/webapps/jaga

RUN echo "<h1> jaga docker app </h1>"> tomcat8/webapps/jaga/index.html

EXPOSE 8080

CMD [ "tomcat8/bin/startup.sh" ]