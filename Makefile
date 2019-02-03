DIR = .
FILE = Dockerfile
IMAGE = devilbox/php-fpm-8.0
TAG = latest

.PHONY: build rebuild test tag pull login push enter

build:
	docker build -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)

rebuild: pull
	docker build --no-cache -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)

test:
	./tests/test.sh $(IMAGE)

tag:
	docker tag $(IMAGE) $(IMAGE):$(TAG)

pull:
	docker pull $(shell grep FROM Dockerfile | sed 's/^FROM//g';)

login:
	yes | docker login --username $(USER) --password $(PASS)

push:
	@$(MAKE) tag TAG=$(TAG)
	docker push $(IMAGE):$(TAG)

enter:
	docker run --rm --name $(subst /,-,$(IMAGE)) -it --entrypoint=bash $(ARG) $(IMAGE)
