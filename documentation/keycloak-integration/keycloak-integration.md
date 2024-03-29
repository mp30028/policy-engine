## Overview

The Policy Engine is made up of three main components:-
 - **Keycloak** to provide user authentication services to secure the UI
 - **Policy-Engine-API** to provide the business services that the UI needs
 - **Policy-Engine-UI** the main user application through which the user interacts with the Policy-Engine
 
These components are setup to run within docker containers. Docker compose scripts are used to orchestrate the start of these containers and the diagram below shows their arrangements and setup.


![Orchestration using docker compose](./01-orchestration.png)


## 1. Setting up and starting Keycloak with SSL/TLS on developers local machine

### Points to note
 - The Keycloak setup for this project uses a MySql database for it's datastore. 
 - The single docker-compose.yml script starts up the MySql database first then start the Keycloak Application, which depends on the database. 
 - There is an initdb.sql script provided and the first time the docker-compose.yml script is run it uses this sql script to restore an outline configuration exported from a previous setup.
 - For Keycloak to work properly TLS (https) needs to be setup to protect all the web interfaces i.e.
 	 - Endpoints to access Keycloak UI and Authentication Services (API)
 	 - Endpoints to access Policy-Engine-Api
 	 - Endpoints to access Policy-Engine-Ui


#### 1.1: Generate a self signed certificate	using openssl
On Windows in the wsl-ubuntu distribution run the following command<br/>
<br/>
`openssl req -config keycloak-cert.config -newkey rsa -x509 -days 3650 -out keycloak.crt`<br/>
<br/>
NB: it requires a config file called keycloak-cert.config. A sample copy of this [file can be found here](./generating-self-signed-certificate/keycloak-cert.config)<br/>
This will generate two files called `keycloak.crt` and `keycloak.key`

#### 1.2: Add the self signed certificates to Keycloak
Copy the the two generated files to the `/policy-engine/docker/keycloak/certs` folder. The docker-compose script is setup to map to these files and use them to enable tls/ssl on keycloak

#### 1.3: Start up Keycloak
- `cd /policy-engine/docker/keycloak` folder.
- run `docker compose up -d` and wait for the container to come up
- Once the docker-compose script completes, check everything is ok with `docker ps`. You should see output as per below<br/>
![Docker Keycloak containers](./02-keycloak-docker-ps.png)

#### 1.4: Check SSL is enabled and working on Keycloak
Test using the `SSLPoke` test utility.
- `cd \policy-engine\docker\policy-engine\ui\SSLPoke`
- run `java SSLPoke localhost 4499`. Now because the self-signed certificate is not yet trusted you should see an error like the one below<br/>
![untrusted cert error](./03-signature-check-failed.png)

- To fix the error we need to trust the self signed certificate, but before we can do that we need to get a copy of the client certificate as shown in the next step

#### 1.5: Get a copy of the client certificate
- navigate to the Keycloak url (https://localhost:4499/) in a browser<br/>
![Keycloak UI](./04-navigate-to-keycloak.png)
---
- Click on the *Not-Secure* indicator in the address bar<br/>
![Not Secure Indicator](./05-not-secure-indicator.png)
---
- You should now see a pop up with a message and a link to view the certificate details<br/>
![Not Secure Pop-Up Message](./06-not-secure-pop-up.png)
---
- Clicking on export to save the client certificate<br/>
![Export the client certificate](./07-show-certificate.png)

#### 1.6: Add the client certificate to the jre keystore

- run the following command to import the client certificate saved in the previous step<br/>
`keytool -import -trustcacerts -cacerts -storepass changeit -noprompt -alias zonesoft-dev -file C:\Users\mebs_\Downloads\_.zonesoft.dev.crt`<br/>
![Client certificate import](./08-cert-successfully-added.png)

- in case there is already a certificate with the same alias and you want to update it with the latest one then you can delete the existing certificate in the keystore with the following command <br/>
`keytool -delete -noprompt -alias zonesoft-dev  -cacerts  -storepass changeit`

#### 1.7: Redo the check (Step-1.4 above) to see if SSL is enabled and working on Keycloak
 - This time the check should succeed<br/>
 ![Successful poke](./09-redo-check.png)
 
#### 1.8 Startup Keycloak
  - `cd ......./policy-engine/docker/keycloak` folder
  - run `docker compose up -d` to start up the application
  
## 2. Setting up and starting Policy-Engine-API
### Points to note
 - TLS/SSL is enabled by setting the following three properties in the policy-engine-api spring-boot-app
 	- `server.ssl.key-store`
 	- `server.ssl.key-store-password`
 	- `server.ssl.key-store-type`
 -  `server.ssl.key-store-type` is set to *pkcs12* format. Hence we need to get a self signed certificate in this format
 - We can use the self-signed certificates generated in *step 1.1* earlier, but need to convert it to *pkcs12* format first
 
#### 2.1 Convert self signed certificates to pkcs12 format
  - change into the directory where the self signed certs were generated with `openssl` command in *step 1.1*
  - run the conversion command `openssl pkcs12 -export -out keycloak.p12 -inkey keycloak.key -in keycloak.crt`<br/>
  You will be prompted for an export password. Make a note of it as it will be needed to set the spring-boot-app `server.ssl.key-store-password` property<br/>
  ![Converting to pkcs12](./10-convert-to-pkcs12.png)
  
#### 2.2 Set up TLS/SSL
  - copy the *keycloak.p12* file created in the previous step to `......./policy-engine/docker/policy-engine/api/certs` folder
  - the docker-compose script should be setup to use this file by default

#### 2.3 Startup the database used by policy-engine-api
  - `cd ......./policy-engine/docker/policy-engine/db` folder
  - run `docker compose up -d` to start up the database required by the policy-engine-api application

#### 2.4 Startup the policy-engine-api application
  - `cd ......./policy-engine/docker/policy-engine/api` folder
  - run `docker compose up -d` to start up the application
  
#### 2.5 Test the APIs are only accessible over https
  - In the browser try the [non secured url](http://localhost:9998/policy-engine/api/asset-type)<br/>
  ![Test http access to API](./11-test-http-access-to-api.png)
  - repeat the test with the [secured url](https://localhost:9998/policy-engine/api/asset-type)<br/>
  ![Test https access to API](./12-test-https-access-to-api.png)
 
 
## 3. Setting up and starting Policy-Engine-UI
### Points to note
 - Like policy-engine-api TLS/SSL is enabled by setting the following three properties in the policy-engine-ui spring-boot-app
 	- `server.ssl.key-store`
 	- `server.ssl.key-store-password`
 	- `server.ssl.key-store-type`
 -  `server.ssl.key-store-type` is set to *pkcs12* format. Hence we need to get a self signed certificate in this format
 - We can use the converted self-signed certificates generated in *step 2.1* earlier
 - To get an good overview of how the UI interacts with the different component the following diagram may help<br/>
 ![UI Interaction](./13-ui-interactions.png)
 
#### 3.1 Set up TLS/SSL
  - copy the *keycloak.p12* file created in the previous step to `......./policy-engine/docker/policy-engine/ui/certs` folder
  - the docker-compose script should be setup to use this file by default

#### 3.2 Startup Keycloak if not already started
  - See *step 1.8*

#### 3.3 Startup policy-engine-api if not already started
  - See *step 2.3*, *step 2.4*  and *step 2.5* 

#### 3.4 Startup the policy-engine-ui application
  - `cd ......./policy-engine/docker/policy-engine/ui` folder
  - run `docker compose up` to start up the application
  - It should fail to start as it needs valid client certs for both keycloak and the policy-engine-api<br/>
  ![startup failure](./14-ui-start-fail.png)<br/>
  
#### 3.5 Get the required Client Certificates and set them up for policy-engine-ui
  - To fix the start up issue, copy the previously generated client certificate (see *step 1.5*) to `......\policy-engine\docker\policy-engine\ui\certs\cacert`
  - rename the file to **kc-client.crt**
  - make another copy of the same file in the same folder and rename it to **p-engine-client.crt**
  - you should have a certs folder that looks something like the following
  ![certs folder](./15-certs-folder.png)
  - run `docker compose up` to start up the application. This time it should start without issues
  
#### 3.6 Test the Application is running by accessing it in the browser

## 4. Configuring the Application and Keycloak for Authentication
