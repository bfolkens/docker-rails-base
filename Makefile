LOCAL_NAME=rails-base
VERSION=ruby-2.3.3-gems-2.6.8
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

