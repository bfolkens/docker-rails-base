LOCAL_NAME=rails-base
VERSION=ruby-1.9.3-gems-1.8.23.2
PUBLIC_NAME=rails-base
REPOSITORY=bfolkens


.PHONY: all build tag release

all: build

build:
	docker build -t $(LOCAL_NAME):$(VERSION) --rm .

tag: build
	docker tag $(LOCAL_NAME):$(VERSION) $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

release: tag
	docker push $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

