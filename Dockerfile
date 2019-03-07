FROM openjdk:12-alpine
RUN apt-get -y update && apt-get -y install default-jdk tomcat8 \
ln -s /usr/share/tomcat8/bin/catalina.sh /usr/local/bin/catalina.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
COPY target/*.war /opt/lib/tomcat8/webapps/
EXPOSE 7000
CMD tomcatup
ENTRYPOINT ["/docker-entrypoint.sh"] 
