#!/bin/sh
set -e
set -x
cd /var/source
apt-get update -y
apt-get install -y curl
curl -sS https://getcomposer.org/installer | \
  hhvm --php -- --install-dir=/opt/composer
hhvm -d hhvm.jit=0 /opt/composer/composer.phar install
hh_client
hhvm -d hhvm.jit=0 vendor/bin/phpunit
