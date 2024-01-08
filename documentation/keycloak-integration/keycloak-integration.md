## Overview

The Policy Engine is made up of three main components:-
 - **Keycloak** to provide user authentication services to secure the UI
 - **Policy-Engine-API** to provide the business services that the UI needs
 - **Policy-Engine-UI** the main user application through which the user interacts with the Policy-Engine
 
These components are setup to run within docker containers. Docker compose scripts are used to orchestrate the start of these containers and the diagram below shows their arrangements and setup.


![Orchestration using docker compose](./01-orchestration.png)


## Setting up and starting Keycloak

### Points to note
 - The Keycloak setup for this project uses a MySql database for it's datastore. 
 - The single docker-compose.yml script starts up the MySql database first then start the Keycloak Application, which depends on the database. 
 - There is an initdb.sql script provided and the first time the docker-compose.yml script is run it uses this sql script to restore an outline configuration exported from a previous setup.
 - For Keycloak to work properly TLS (https) needs to be setup to protect all the web interfaces i.e.
 	 - Endpoints to access Keycloak UI and Authentication Services (API)
 	 - Endpoints to access Policy-Engine-Api
 	 - Endpoints to access Policy-Engine-Ui

### Setting SSL/TLS protection for Keycloak on developers local machine

#### Step-1: Generate a self signed certificate	using openssl
On Windows in the wsl-ubuntu distribution run the following command<br/>
<br/>
`openssl req -config keycloak-cert.config -newkey rsa -x509 -days 3650 -out keycloak.crt`<br/>
<br/>
NB: it requires a config file called keycloak-cert.config. A sample copy of this [file can be found here](./generating-self-signed-certificate/keycloak-cert.config)<br/>