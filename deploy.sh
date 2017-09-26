#!/bin/bash

# Assumptions
# - all services will be a the same directory level (i.e. root/[service])
# - service name in ECS matches the directory name of its service in this project

# SERVICES - list of all microservice directory names, separated by a comma
SERVICES='microservice-1 microservice-2 microservice-3'
CHANGES=$(git diff --name-only)

for SERVICE in $SERVICES
do
	
	CHANGESFOUND=$(grep $SERVICE <<< "$CHANGES");
	
	# Might want to change this condition to something more binary
	if [ "$CHANGESFOUND" != "" ] 
	then
		echo "CHANGE DETECTED HERE:" $CHANGESFOUND;
		cd ~/DEV/poc-pipeline/$SERVICE;
	    docker build -t $SERVICE:$TRAVIS_BUILD_NUMBER .;
		docker tag $SERVICE:$TRAVIS_BUILD_NUMBER $AWS_ACCOUNT_NUMBER.dkr.ecr.us-east-1.amazonaws.com/$SERVICE:$TRAVIS_BUILD_NUMBER
		docker push $AWS_ACCOUNT_NUMBER.dkr.ecr.us-east-1.amazonaws.com/$SERVICE:$TRAVIS_BUILD_NUMBER
	fi;

done
