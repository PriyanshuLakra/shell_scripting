
This is a Devops project.

The django-notes-app is a web notepad in which we can write and save our notes
First we made the docker-compose.yml file for containerization of the project ..there are three containers for running this project . First one is django-notes-app frontend itself which use maven
to build . Second is MYSQL container for storing data . Third is Nginx for using port 80 (reverse proxy) 
All the Three containers are running on different ports ..django-notes-app -> 8000 , MYSQL-> 3600 , Nginx-> 80 
ALl three containers are connected by common network so that they can exchange data and information with each other 

At Last i have writen a Deploy.sh file for Shell-Scripting so that i can automate the whole process
