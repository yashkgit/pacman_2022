FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip unzip vim -y
COPY .  /var/www/html
WORKDIR /var/www/html
EXPOSE 80
CMD ["/usr/sbin/httpd" , "-D" , "FOREGROUND"]
