IMAGE_NAME := nedmedia/wowza-streaming-engine-persistent
WOWZA_VERSION := 4.8.17
MINOR := 0

build:
	docker build --rm --build-arg WOWZA_VERSION=$(WOWZA_VERSION) -t $(IMAGE_NAME):$(WOWZA_VERSION)-$(MINOR) .
	
run:
	@echo docker run -p 8087:8087 -p 80:80 --rm -it $(IMAGE_NAME):$(WOWZA_VERSION)-$(MINOR) /sbin/entrypoint.sh
	
shell:
	docker run --rm -it --entrypoint sh $(IMAGE_NAME):$(WOWZA_VERSION)-$(MINOR) -l

test: build
	docker ps | grep -q $(IMAGE_NAME)
