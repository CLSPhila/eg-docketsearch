
.PHONE build-push:
build-push:
	docker build . -t natev/eg-docketscraper:latest
	docker push natev/eg-docketscraper:latest
