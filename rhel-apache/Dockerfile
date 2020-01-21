FROM registry.access.redhat.com/ubi7/ubi

LABEL MAINTAINER="Jong Seok Won <jwon@redhat.com>"
LABEL version="0.1"
LABEL description="Running RHEL7 docker image on mac"

USER root

# Add Web server, update image, and clear cache
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager httpd -y && rm -rf /var/cache/yum

# Add some data to web server
RUN echo "This Web server is working." > /var/www/html/index.html
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]
