FROM tomcat:9.0-jre11-slim

# Remove the default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the war file from the current directory into the container at /usr/local/tomcat/webapps/
COPY /target/mvn-project.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Command to start Tomcat when the container starts
CMD ["catalina.sh", "run"]
