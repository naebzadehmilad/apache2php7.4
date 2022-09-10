FROM ubuntu 
MAINTAINER Milad.Naebzadeh
RUN  apt update && apt install -y \
	software-properties-common \
	apt-transport-https  && \
	add-apt-repository ppa:ondrej/php -y && \
	apt update && \
	apt install -y \
	apache2 \
	net-tools \
	nano \
	wget \
	vim \
	netcat  
RUN export DEBIAN_FRONTEND=noninteractive  && apt -y install \
	php-pear\
	tzdata \
	php7.4 && \
	update-alternatives --set php /usr/bin/php7.4 && \
	apt install -y \
	php7.4-bcmath \
	php7.4-ctype \
	php7.4-curl \
	php7.4-opcache \
	php7.4-dom \
	php7.4-fileinfo \
	php7.4-dom \
	php7.4-iconv \
	php7.4-intl \
	php7.4-bcmath \
	php7.4-bz2 \
	php7.4-curl \
	php7.4-intl \	
	php7.4-mbstring \
	php7.4-mysql \
	php7.4-readline \
	php7.4-zip \
	php7.4-json \
	php7.4-mbstring \
	php7.4-simplexml \
	php7.4-soap \
	php7.4-sockets \
	php7.4-tokenizer \
	php7.4-xmlwriter \
	php7.4-xsl \
	php7.4-zip  \ 
	php7.4-mbstring \
	php7.4-dev \
	php7.4-amqp \ 
	php7.4-redis \
	php7.4-gd  && \
        apt-get clean  
RUN wget -c https://getcomposer.org/download/2.2.0/composer.phar -O  /usr/local/bin/composer2 && \
    wget -c https://getcomposer.org/download/1.10.0/composer.phar -O  /usr/local/bin/composer && \
	chmod +x /usr/local/bin/composer*
COPY ./vhost.conf  /etc/apache2/sites-enabled/000-default.conf    
COPY     ./php.ini	/etc/php/7.4/cli/php.ini 
COPY    ./php.ini  /etc/php/7.4/apache2/php.ini 
COPY     ./apache2.conf /etc/apache2/apache2.conf	
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
EXPOSE 80
CMD apachectl -D FOREGROUND 
