## Overview

The Policy Engine is made up of three main components:-
 - **Keycloak** to provide user authentication services to secure the UI
 - **Policy-Engine-API** to provide the business services that the UI needs
 - **Policy-Engine-UI** the main user application through which the user interacts with the Policy-Engine
 
These components are setup to run within docker containers. Docker compose scripts are used to orchestrate the start of these containers and the diagram below shows their arrangements and setup.


![Orchestration using docker compose](./01-orchestration.png)
