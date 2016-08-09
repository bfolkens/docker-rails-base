LOCAL_NAME=rails-base
VERSION=ruby-2.3.0-gems-2.6.2
PUBLIC_NAME=rails-base
REPOSITORY=874481312238.dkr.ecr.us-east-1.amazonaws.com


.PHONY: all build tag release

all: build

build:
	docker build -t $(LOCAL_NAME):$(VERSION) --rm .

tag: build
	docker tag $(LOCAL_NAME):$(VERSION) $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

release: tag
	docker push $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

