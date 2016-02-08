#!/bin/bash

oc new-project example \
    --description="WordPress HHVM" \
    --display-name="WordPress HHVM"

echo "hhvm"
oc create -f hhvm/BuildConfig.yaml
oc create -f hhvm/ImageStream.yaml
oc create -f hhvm/DeploymentConfig.yaml
oc create -f hhvm/Services.yaml
oc create -f hhvm/Route.yaml
oc start-build hhvm
