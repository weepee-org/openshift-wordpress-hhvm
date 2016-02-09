#!/bin/bash

oc new-project wordpress-hhvm \
    --description="WordPress HHVM" \
    --display-name="WordPress HHVM"

oc create -f Gluster-Service.yaml
oc create -f Gluster-Endpoints.yaml
oc create -f PersistentVolumeClaim.yaml

echo "hhvm"
oc create -f hhvm/BuildConfig.yaml
oc create -f hhvm/ImageStream.yaml
oc create -f hhvm/DeploymentConfig.yaml
oc create -f hhvm/Services.yaml
oc create -f hhvm/Route.yaml
oc start-build hhvm

echo "mysql"
PASSWORD=$(openssl rand 12 -base64)
echo "DB wordpress USER wordpress PASSWORD ${PASSWORD}"
oc process -f MysqlTemplate.yaml -v MYSQL_DATABASE=wordpress,VOLUME_CAPACITY=512Mi,MYSQL_USER=wordpress,MYSQL_PASSWORD=${PASSWORD} | oc create -f -
