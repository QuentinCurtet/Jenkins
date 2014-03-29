FROM ubuntu
MAINTAINER Roth Mathieu "mathieu_roth@hotmail.fr"
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key && sudo apt-key add -
ADD sudo sh -c echo deb http://pkg.jenkins-ci.org/debian binary/ >> /etc/apt/sources.list.d/jenkins.list
RUN sudo apt-get update
RUN sudo apt-get install jenkins
ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
VOLUME ["/jenkins"]
CMD [""]
