#!/bin/bash

rm -f latest.tar.gz > /dev/null 2>&1
wget https://wordpress.org/latest.tar.gz
tar zxvf latest.tar.gz
echo latest.tar.gz > .gitignore
mv wordpress hhvm/
