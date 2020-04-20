# Hanzo demo pipeline

## Flask app
I straight up copied this from the internet to get a Python Flask container.

http://containertutorials.com/docker-compose/flask-simple-app.html

## Configuration
The application is configured using configMaps.  These should contain the individual environment 
configurations.  These will be set as environment variables that you can access from the application
