FROM openjdk:12-alpine
RUN apt-get -y update && apt-get -y install default-jdk tomcat8 \
ln -s /usr/share/tomcat8/bin/start.sh /usr/local/bin/start.sh tomcatup
COPY target/*.war /opt/lib/tomcat8/webapps/
EXPOSE 7000
CMD tomcatup
