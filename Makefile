LOCAL_NAME=rails-base
VERSION=ruby-2.5.0-gems-2.7.6-2
PUBLIC_NAME=docker-rails-base
REPOSITORY=bfolkens


.PHONY: all build tag release

all: build

build:
	docker build -t $(LOCAL_NAME):$(VERSION) --rm .

tag: build
	docker tag $(LOCAL_NAME):$(VERSION) $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

release: tag
	docker push $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

