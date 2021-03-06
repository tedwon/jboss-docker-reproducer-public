FROM registry.access.redhat.com/ubi7/ubi

LABEL MAINTAINER="Jong Seok Won <jwon@redhat.com>"
LABEL version="0.1"
LABEL description="Red Hat JBoss Core Services Apache HTTP Server 2.4.29 Patch 02 for RHEL 7 x86_64 & JBoss EAP 7.2"

USER root

# jbcs-httpd24-httpd-2.4.29-RHEL7-x86_64.zip
# jbcs-httpd24-httpd-2.4.29-SP2-RHEL7-x86_64.zip
# httpd.conf
# mod_jk.conf
# uriworkermap.properties
# workers.properties
# jboss-eap-7.2.0.zip
# standalone.conf
# session.war
# appStarterScript.sh
# masterControlScript.sh

ENV HOME /root
ENV TMP ${HOME}/downloads
ENV JBCS_BASE /opt/rh
ENV JBCS_HOME ${JBCS_BASE}/jbcs-httpd24-2.4/httpd
ENV EAP_BASE /opt/eap
ENV EAP_HOME ${EAP_BASE}/jboss-eap-7.2

# Add OpenJDK, update image, and clear cache
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager unzip elinks krb5-workstation mailcap java-1.8.0-openjdk-devel -y && rm -rf /var/cache/yum

# Copy local artifacts to docker tmp-directory
RUN mkdir ${TMP}; mkdir ${JBCS_BASE}; mkdir ${EAP_BASE}
ADD . ${TMP}

RUN unzip ${TMP}/'jbcs-httpd24-httpd-2.4.29-RHEL7-x86_64.zip' -d ${JBCS_BASE};
RUN unzip -o ${TMP}/'jbcs-httpd24-httpd-2.4.29-SP2-RHEL7-x86_64.zip' -d ${JBCS_BASE};
RUN rm ${JBCS_HOME}/conf.d/*
RUN mv ${TMP}/httpd.conf ${JBCS_HOME}/conf/
RUN mv ${TMP}/mod_jk.conf ${JBCS_HOME}/conf.d/
RUN mv ${TMP}/uriworkermap.properties ${JBCS_HOME}/conf.d/
RUN mv ${TMP}/workers.properties ${JBCS_HOME}/conf.d/
RUN mv ${TMP}/appStarterScript.sh ${JBCS_HOME}/
RUN mv ${TMP}/masterControlScript.sh ${HOME}/

#On a command line, change directory to HTTPD_HOME.
#Run the following command to create the apache user group:
WORKDIR ${JBCS_HOME}
RUN groupadd -g 48 -r apache

#Run the following command to create the apache user in the apache user group:
RUN useradd -c "Apache" -u 48 -g apache -s /bin/sh -r apache

#From HTTPD_HOME, issue the following command to assign the ownership of the Apache directories to the apache user to allow the user to run Apache HTTP Server:
RUN chown -R apache:apache *

#Disabling/Enabling SSL Support
#Apache HTTP Server supports SSL by default, but it can be disabled. Follow this procedure to disable or re-enable SSL support.
#Go to the HTTPD_HOME/conf.d/ directory and rename the SSL configuration file:
#To disable SSL, rename ssl.conf to ssl.conf.disabled.
#RUN mv ${JBCS_HOME}/conf.d/ssl.conf ${JBCS_HOME}/conf.d/ssl.conf.disabled
# RUN mv conf.d/ssl.conf conf.d/ssl.conf.disabled

#Running the Apache HTTP Server Post-Installation Script
#On a command line, change to the HTTPD_HOME directory (root user access not required).
RUN ./.postinstall

# Add some data to web server
# RUN echo "This JBCS Apache HTTPD Web server is working." > ${JBCS_HOME}/www/html/index.html

RUN unzip ${TMP}/'jboss-eap-7.2*.zip' -d ${EAP_BASE};
RUN mv ${TMP}/standalone.conf ${EAP_HOME}/bin/
RUN ${EAP_HOME}/bin/add-user.sh -m -u 'admin' -p 'admin123!'
RUN mv ${TMP}/session.war ${EAP_HOME}/standalone/deployments/

##################################################
# The masterControlScript needs to run as root
# if you want to run other services as another user
# you will have to handle that in the appStarterScript.sh
##################################################
USER root
WORKDIR ${HOME}
CMD ./masterControlScript.sh

EXPOSE 2080 8080 9990
