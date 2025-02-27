# vim:set ft=dockerfile:

FROM cimg/base:2021.07

LABEL maintainer="Community & Partner Engineering Team <community-partner@circleci.com>"

ENV PHP_VERSION 7.0.33
ENV PHP_MINOR 7.0

RUN sudo add-apt-repository -y ppa:ondrej/php && \
	sudo apt-get install -y php${PHP_MINOR} php${PHP_MINOR}-dev && \
	sudo rm -rf /var/lib/apt/lists/*

# Pre-install a few very popular PHP extensions
RUN sudo apt-get update && sudo apt-get install -y \
		php$PHP_MINOR-bcmath \
		php$PHP_MINOR-curl \
		php$PHP_MINOR-gd \
		php$PHP_MINOR-mbstring \
		php$PHP_MINOR-mysql \
		php$PHP_MINOR-pgsql \
		php$PHP_MINOR-phpdbg \
		php$PHP_MINOR-xml \
		php$PHP_MINOR-zip \
	&& \
	# Only install the JSON extension in PHP 5 and 7
	if (( 7 <= 7 )); then \
		sudo apt-get install -y php$PHP_MINOR-json; \
	fi && \
	sudo rm -rf /var/lib/apt/lists/*

# Install the PHP package manager Composer
ENV COMPOSER_VERSION 2.1.7
RUN sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	sudo php composer-setup.php --version=$COMPOSER_VERSION --install-dir=/usr/local/bin --filename=composer && \
	sudo php -r "unlink('composer-setup.php');" && \
	composer --version
ENV PATH /home/circleci/.config/composer/vendor/bin:/home/circleci/.composer/vendor/bin:$PATH
