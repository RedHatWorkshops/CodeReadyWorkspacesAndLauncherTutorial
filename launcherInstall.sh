#!/bin/bash

BASE="https://raw.githubusercontent.com/fabric8-launcher/launcher-openshift-templates/master"
PROPS=$(curl -s $BASE/released.properties)
#PROPS=$(curl -s https://raw.githubusercontent.com/fabric8-launcher/launcher-openshift-templates/22aea3364f3263b5e1259d1bf123dfac725e17e1/released.properties)
PARAMS=""

for p in $PROPS; do
    PARAMS="$PARAMS -p $p"
done

echo This script will install the Launcher on OpenShift cluster. Make sure that:
echo 
echo  - You have run oc login previously
echo 
echo Press ENTER to continue ...
read 

echo Creating launch project ...
oc new-project launch

echo Processing the template and installing ...
oc process --local -f $BASE/openshift/launcher-template.yaml \
    LAUNCHER_KEYCLOAK_URL=$KEYCLOAK_URL/auth \
    LAUNCHER_KEYCLOAK_REALM=$KEYCLOAK_REALM \
    LAUNCHER_KEYCLOAK_CLIENT_ID=$KEYCLOAK_CLIENT_ID \
    LAUNCHER_MISSIONCONTROL_OPENSHIFT_CONSOLE_URL=$(oc status | grep "on server" | sed 's/.*on server //') \
   $PARAMS -o yaml | oc create -f -

echo Enabling Launcher Creator
oc set env dc/launcher-frontend LAUNCHER_CREATOR_ENABLED=true

oc get cm launcher -o yaml | sed -e 's/launcher.missioncontrol.openshift.password: developer/launcher.missioncontrol.openshift.password: ""/' -e 's/launcher.missioncontrol.openshift.username: developer/launcher.missioncontrol.openshift.username: ""/' | oc replace -f -

echo All set! Enjoy!

