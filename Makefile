LOCAL_NAME=rails-base
VERSION=ruby-1.9.3-gems-1.8.23.2
PUBLIC_NAME=rails-base
REPOSITORY=874481312238.dkr.ecr.us-east-1.amazonaws.com


.PHONY: all build tag release

all: build

build:
	podman build -t $(LOCAL_NAME):$(VERSION) --rm .

tag: build
	podman tag $(LOCAL_NAME):$(VERSION) $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

release: tag
	podman push $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

