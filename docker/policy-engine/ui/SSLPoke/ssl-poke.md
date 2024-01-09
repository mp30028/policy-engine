
## Introduction
SSLPoke is a java program that connects via SSL to a host and port of your choice. The server could be a web server, mail server or any other server that supports SSL. The main objective is to determine whether java is able to authenticate the server's certificate using its trusted CA certificate store. This program also verifies whether the host and port are correct.

## Usage
Open a command prompt and `cd` to the folder containing the `SSLPoke.class` file'<br/>

Then type: `java SSLPoke <host> <port>`

## Error Messages
- **javax.net.ssl.SSLHandshakeException** : sun.security.validator.ValidatorException: PKIX path building failed. <br/>
Java cannot authenticate the server's SSL certificate because its Certificate Authority (CA) is not present in its trusted CA store.

- **java.net.UnknownHostException** :<br/>
The host name is invalid i.e. not resolvable by your DNS server

- **java.net.ConnectException** : Connection refused<br/>
Port is invalid. No server is listening on that port.

- **java.net.ConnectException** : Operation timed out<br/>
The host and port combo cannot be connected. Most likely your firewall is blocking the connection, or, the IP address of the host is incorrect.

- **javax.net.ssl.SSLProtocolException** : handshake alert: unrecognized_name<br/>
There is a mismatch between host specified in input and host name in the SSL certificate.

- **Error: Could not find or load main class SSLPoke**<br/>
You are not in the directory that contains the SSLPoke.class file. cd to that directory and try again.

- **FAILURE: javax.net.ssl.SSLException** : Unrecognized SSL message, plaintext connection?<br/>
You are connecting to a non-SSL port.