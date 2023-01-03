FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip unzip vim -y
ADD https://github.com/yashkgit/pacman_2022.git  /var/www/html
WORKDIR /var/www/html
EXPOSE 80
CMD ["/usr/sbin/httpd" , "-D" , "FOREGROUND"]
