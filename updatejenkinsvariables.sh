#!/bin/bash

echo "By Mauricio Lopez"

if [ $# -ne 3 ] 
then
        echo "usage: updatejenkinsvariables.sh VARIABLE_NAME DESCRIPTION VALUE"
		echo "for example: updatejenkinsvariables.sh PRELOAD_VARIABLE_0 Jira-ticket-4579 0"
		exit 1
fi

VARIABLE_NAME=$1
DESCRIPTION=$2
VALUE=$3
JOB_PATH_1=/cinder/app1/JENKINS_HOME/jobs/fe-account/jobs/fe-account-update
JOB_PATH_2=/cinder/app1/JENKINS_HOME/jobs/fe-checkout/jobs/fe-checkout-update
JOB_PATH_3=/cinder/app1/JENKINS_HOME/jobs/fe-devops/jobs/fe-devops-update
JOB_PATH_4=/cinder/app1/JENKINS_HOME/jobs/fe-ecomm/jobs/fe-ecomm-update
JOB_PATH_5=/cinder/app1/JENKINS_HOME/jobs/fe-instore/jobs/fe-instore-update
JOB_PATH_6=/cinder/app1/JENKINS_HOME/jobs/fe-mandm/jobs/fe-mandm-update
JOB_PATH_7=/cinder/app1/JENKINS_HOME/jobs/fe-search/jobs/fe-search-update
JOB_PATH_8=/cinder/app1/JENKINS_HOME/jobs/fe-shop/jobs/fe-shop-update

JOBS=($JOB_PATH_1 $JOB_PATH_2 $JOB_PATH_3 $JOB_PATH_4 $JOB_PATH_5 $JOB_PATH_6 $JOB_PATH_7 $JOB_PATH_8)

for j in ${JOBS[*]}; do

#between </hudson.model.StringParameterDefinition> and </parameterDefinitions>
 
 cd $JOB_PATH_$j
 sed -i '/<\/parameterDefinitions>/i <hudson.model.StringParameterDefinition>' config.xml
 sed -i '/<\/parameterDefinitions>/i <name>'$VARIABLE_NAME'</name>' config.xml
 sed -i '/<\/parameterDefinitions>/i <description>'$DESCRIPTION'</description>' config.xml
 sed -i '/<\/parameterDefinitions>/i <defaultValue>'$VALUE'</defaultValue>' config.xml
 sed -i '/<\/parameterDefinitions>/i </hudson.model.StringParameterDefinition>' config.xml
 pwd 
done
