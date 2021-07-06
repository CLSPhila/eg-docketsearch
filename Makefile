
SHELL := /bin/bash

ifneq (,$(wildcard ./.env))
	include .env
	export
endif


.PHONY : build
build :
	docker build -f Dockerfile --tag ${REPOSITORY}/${IMAGENAME}:${TAG} https://github.com/CLSPhila/eg-docketsearch.git


.PHONY : push
push :
	docker push ${REPOSITORY}/${IMAGENAME}:${TAG}
    

