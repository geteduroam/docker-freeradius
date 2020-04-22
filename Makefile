
debug:
	docker run -t make-freeradius -X

certs:
	stat -t certs/ca.pem
	stat -t certs/server.key
	stat -t certs/server.pem

build: certs
	docker build . -t make-freeradius

run:
	docker run -t make-freeradius

.PHONY: build debug run certs
