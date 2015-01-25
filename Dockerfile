FROM ppschweiz/apache

RUN apt-get update && apt-get install -y \
		curl \
		libapache2-mod-php5 \
		php5-curl \
		php5-gd \
		php5-mysql \
		php5-ldap \
		rsync \
		wget \
		git \
	&& rm -rf /var/lib/apt/lists/*

COPY docker-apache.conf /etc/apache2/sites-available/lamp
RUN a2dissite 000-default && a2ensite lamp

CMD ["apache2", "-DFOREGROUND"]

