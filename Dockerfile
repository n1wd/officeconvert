FROM paijp/centos6-apache-php-sqlite2

RUN \
	set -x &&\
	yum install -y libreoffice-headless libreoffice-calc libreoffice-writer libreoffice-impress

RUN \
	set -x &&\
	yum install -y libreoffice-langpack-ja

RUN \
	set -x &&\
	mkdir -p /var/www/html/work &&\
	chown apache:apache /var/www/html/work

RUN \
	set -x &&\
    yum groupinstall "fonts" -y &&\
    fc-cache -fv

ADD index.php /var/www/html/

EXPOSE 8080
CMD apachectl start&&tail -f /var/log/httpd/access_log
