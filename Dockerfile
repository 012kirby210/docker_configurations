FROM php:8-apache

RUN a2enmod ssl && a2enmod rewrite 
RUN mkdir -p /etc/apache2/ssl
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY ./ssl/*.pem /etc/apache2/ssl
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

RUN mkdir -p /home/composer
RUN cd /home/composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae'){ echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer

RUN apt-get update
RUN apt-get install -y git

RUN docker-php-ext-install pdo_mysql

EXPOSE 80
EXPOSE 443
