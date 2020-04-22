# FreeRADIUS configuration for geteduroam

Add certificates:

* raddb/certs/ca.pem
* raddb/certs/server.key
* raddb/certs/server.pem

## Run using Docker

Build the docker container

	make build

Test the docker container

	make debug

Run the docker container (in the background)

	make run
