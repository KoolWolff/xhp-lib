#!/bin/sh
set -e
set -x
cd /var/source
hhvm -d hhvm.jit=0 composer.phar install
hh_client
hhvm -d hhvm.jit=0 vendor/bin/phpunit
