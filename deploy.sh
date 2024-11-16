#!/bin/bash


#first clone the project from github and handle the error

code_clone(){
	
   echo "clonning the project"
   if [-d "django-notes-app"]; then
	   echo "the code dir already exists.skipping clone"
   else
	   git clone https://github.com/LondheShubham153/django-notes-app || {
	   echo "failed to clone" 
	   return 1
	   }
   fi
   cd django-notes-app || {
        echo "Failed to change directory to django-notes-app"
        return 1
    }
}


#installing the requirements to run the project

installing_requirements(){
	
	echo "installing dependencies"
	sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
	echo "failed to install dependiencies"
	return 1
	}
}

#Function to perform required restarts

required_restarts(){
	
	echo "performing required restarts"
	sudo chown "$USER" /var/run/docker.sock || {
	echo "falied to change ownership of docker.sock"
	return 1
	}
}


# deploying the project using docker.compose.yml file

deploy_project(){
	
	docker-compose up -d || {
	echo "failed to build and deploy the project"
	return 1
	}
}



echo "********* DEPLOYMENT STARTED *************"

if ! code_clone; then
	cd django-notes-app || exit 1
fi

if ! installing_requirements; then
	exit 1
fi

if ! required_restarts; then
	exit 1
fi

if ! deploy_project; then
	echo "deployment failed"
	exit 1
fi


echo "******* DEPLOYMENT DONE **********"






