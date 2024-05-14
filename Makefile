.PHONY: docker

DOCKER_IMAGE="logsdonlab/repeatmasker70"
DOCKER_TAG="v4.1.0"


docker:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) . -f docker/Dockerfile
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)