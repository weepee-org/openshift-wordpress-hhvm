#!/bin/bash

wget https://wordpress.org/latest.tar.gz
tar zxvf latest.tar.gz
echo latest.tar.gz > .gitignore
mv wordpress hhvm/app
