#!/usr/bin/env bash
#Author: Matheus Faustino (matheuspfaustino <at> gmail <dot> com)
#License: GPLv3
#Copyright 2014

PHP_VERSION=5.6.1

#run just the first time
if [ ! -f /var/log/firsttime ]
then
	touch /var/log/firsttime
	sudo apt-get update

	#install requirements
	sudo apt-get -y install gcc make libzzip-dev libreadline-dev libxml2-dev libssl-dev libmcrypt-dev libcurl4-openssl-dev wget
	
	#installing php
	cd /usr/local/src
	wget http://www.php.net/distributions/php-$PHP_VERSION.tar.gz
	tar -zxvf php-$PHP_VERSION.tar.gz
	cd php-$PHP_VERSION
	./configure --prefix=/usr --with-config-file-path=/etc --enable-maintainer-zts
	#compiling (faster way)
	sudo make -j3 && sudo make -j3 install
	sudo cp php.ini-development /etc/php.ini
	
	#installing pthread
	sudo apt-get -y install autoconf
	sudo pecl install pthreads
	sudo su
	echo "extension=pthreads.so" >> /etc/php.ini
	
	#checking instalation (optional)
	php -m | grep pthreads

	#finishing w/ apache
	sudo apt-get -y install apache2 libapache2-mod-php5
	service apache2 restart > /dev/null 2>&1
fi
