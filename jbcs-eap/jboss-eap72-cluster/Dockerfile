FROM registry.access.redhat.com/ubi7/ubi

LABEL MAINTAINER="Jong Seok Won <jwon@redhat.com>"
LABEL version="0.1"
LABEL description="Red Hat JBoss Core Services Apache HTTP Server 2.4.29 Patch 02 for RHEL 7 x86_64 & JBoss EAP 7.2"

USER root

# jboss-eap-7.2.0.zip
# standalone.conf
# session.war
# appStarterScript.sh
# masterControlScript.sh

ENV HOME /root
ENV TMP ${HOME}/downloads
ENV EAP_BASE /opt/eap
ENV EAP_HOME ${EAP_BASE}/jboss-eap-7.2

# Add OpenJDK, update image, and clear cache
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager unzip java-1.8.0-openjdk-devel iproute -y && rm -rf /var/cache/yum

# Copy local artifacts to docker tmp-directory
RUN mkdir ${TMP}; mkdir ${EAP_BASE}
ADD . ${TMP}

RUN mv ${TMP}/masterControlScript.sh ${HOME}/

RUN unzip ${TMP}/'jboss-eap-7.2*.zip' -d ${EAP_BASE};
RUN mv ${TMP}/standalone.conf ${EAP_HOME}/bin/
RUN ${EAP_HOME}/bin/add-user.sh -m -u 'admin' -p 'admin123!'
RUN mv ${TMP}/session.war ${EAP_HOME}/standalone/deployments/

WORKDIR ${HOME}
CMD ./masterControlScript.sh

# EXPOSE 2080 8080 9990
EXPOSE 2080:2080 7800-7900:7800-7900 9000-9100:9000-9100 8080:8080 9990:9990
