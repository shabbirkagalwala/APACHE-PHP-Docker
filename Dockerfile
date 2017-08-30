FROM centos:7

MAINTAINER skagalwala

#install all necesaary components and update the os
RUN yum -y update && \
    yum -y install httpd && \
    yum -y install php php-mysql php-devel php-gd php-pspell php-xmlrpc php-xml php-pgsql && \
    yum -y install wget && \
    yum -y install unzip && \
    yum clean all 
 
#Expose the container port
EXPOSE 80

#Add our html and php files to the directory, Uncomment the below lines and add your files
#ADD index.html /var/www/html
#ADD insert.php /var/www/html

#Adding PHP Mailer 
RUN wget https://github.com/PHPMailer/PHPMailer/archive/master.zip && \
    unzip master && \
    rm -f  master.zip

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
