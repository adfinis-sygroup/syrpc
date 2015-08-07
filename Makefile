install-php:
	@aptitude -q -y install php5 php5-dev

install-siphash: install-php
	@git clone https://github.com/jedisct1/siphash-php.git; true
	@set -e;
	cd siphash-php; \
	phpize; \
	./configure --enable-siphash; \
	make install
	@rm -rf siphash-php
	echo "extension=siphash.so" > /etc/php5/cli/conf.d/20-siphash.ini
