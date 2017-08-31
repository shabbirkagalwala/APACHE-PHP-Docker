# APACHE-PHP-Docker

Contains Dockerfile to show how to run a simple CentOS docker container with PHP and APACHE installed

Also added Phpmailer to the docker file

Uncomment the lines in the Dockerfile

#ADD index.html /var/www/html

#ADD insert.php /var/www/html

And add the files index.html and insert.php in the same repo, these files will be copied inside the container at /var/www/html

Then build your image:

`docker build -t httpd-php .` 

Then run your container using:

`docker run -d -p 80:80 --name php-apache httpd-php`
