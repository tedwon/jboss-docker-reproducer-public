FROM registry.access.redhat.com/rhel7.6

LABEL MAINTAINER="Jong Seok Won <jwon@redhat.com>"
LABEL version="0.1"
LABEL description="JBoss EAP 7.2"

USER root

RUN subscription-manager register --username <USER_ID> --password <PASSWORD> --auto-attach
RUN subscription-manager repos --enable=rhel-7-server-rpms
RUN subscription-manager repos --enable=rhel-7-server-extras-rpms
RUN subscription-manager repos --enable=rhel-7-server-optional-rpms

# jboss-eap-7.2.0.zip
# standalone.conf
# session.war
# masterControlScript.sh

ENV HOME /root
ENV TMP ${HOME}/downloads
ENV EAP_BASE /opt/eap
ENV EAP_HOME ${EAP_BASE}/jboss-eap-7.2

# Add OpenJDK, update image, and clear cache
RUN yum -y install unzip java-1.8.0-openjdk-devel && yum -y update; yum clean all

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

EXPOSE 8080 9990
