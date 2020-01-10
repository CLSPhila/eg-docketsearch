

.PHONY: build-image
build-image: 
	sudo docker build --tag ${REPOSITORY}/${IMAGENAME}:${TAG} .

.PHONY: push
push:
	sudo docker push ${REPOSITORY}/${IMAGENAME}:${TAG}

.PHONY: build-push
build-push: build-image push
