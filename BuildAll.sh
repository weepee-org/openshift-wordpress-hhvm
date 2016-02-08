#!/bin/bash

oc new-project wordpress-hhvm \
    --description="WordPress HHVM" \
    --display-name="WordPress HHVM"

oc create -f Gluster-Service.yaml
oc create -f Gluster-Endpoint.yaml
oc create -f PersistentVolumeClaim.yaml

echo "hhvm"
oc create -f hhvm/BuildConfig.yaml
oc create -f hhvm/ImageStream.yaml
oc create -f hhvm/DeploymentConfig.yaml
oc create -f hhvm/Services.yaml
oc create -f hhvm/Route.yaml
oc start-build hhvm

echo "mysql"
oc process -f MysqlTemplate.yaml -v MYSQL_DATABASE=wordpress-hhvm,VOLUME_CAPACITY=512Mi | oc create -f -
