ifneq (,)
.error This Makefile requires GNU Make.
endif


# -------------------------------------------------------------------------------------------------
# Docker configuration
# -------------------------------------------------------------------------------------------------

.PHONY: build rebuild test tag pull login push enter

DIR = .
FILE = Dockerfile
IMAGE = devilbox/php-fpm-8.0
TAG = latest


# -------------------------------------------------------------------------------------------------
#  Default Target
# -------------------------------------------------------------------------------------------------

help:
	@echo "lint                      Lint project files and repository"
	@echo "build                     Build Docker image"
	@echo "rebuild                   Build Docker image without cache"
	@echo "test                      Test built Docker image"
	@echo "update-readme             Update README.md with PHP modules"
	@echo "tag [TAG=...]             Retag Docker image"
	@echo "login USER=... PASS=...   Login to Docker hub"
	@echo "push [TAG=...]            Push Docker image to Docker hub"


# -------------------------------------------------------------------------------------------------
#  Lint Targets
# -------------------------------------------------------------------------------------------------
#
lint: lint-workflow

lint-workflow:
	@GIT_BRANCH="$$( git branch | grep '^*' | awk -F' ' '{print $$2}' )"; \
	if echo "$${GIT_BRANCH}" | grep -E '^release-[.0-9]+$$' >/dev/null; then \
		GIT_TAG="$$( echo "$${GIT_BRANCH}" | sed 's/^release-//g' )"; \
		if ! grep 'refs:' -A 100 .github/workflows/nightly.yml \
			| grep  "          - '$${GIT_TAG}'" >/dev/null; then \
			echo "[ERR] New Tag required in .github/workflows/nightly.yml: $${GIT_TAG}"; \
			exit 1; \
		else \
			echo "[OK] Git Tag present in .github/workflows/nightly.yml: $${GIT_TAG}"; \
		fi \
	fi


# -------------------------------------------------------------------------------------------------
#  Build Targets
# -------------------------------------------------------------------------------------------------

build:
	docker build -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)

rebuild: pull-base-image
	docker build --no-cache -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)


# -------------------------------------------------------------------------------------------------
#  Test Targets
# -------------------------------------------------------------------------------------------------

test:
	./tests/test.sh $(IMAGE)

update-readme:
	cat "./README.md" \
		| perl -00 -pe "s/<!-- modules -->.*<!-- \/modules -->/<!-- modules -->\n$$(./tests/get-modules.sh)\n<!-- \/modules -->/s" \
		> "./README.md.tmp"
	yes | mv -f "./README.md.tmp" "./README.md"


# -------------------------------------------------------------------------------------------------
#  Deploy Targets
# -------------------------------------------------------------------------------------------------

tag:
	docker tag $(IMAGE) $(IMAGE):$(TAG)

login:
	yes | docker login --username $(USER) --password $(PASS)

push:
	@$(MAKE) tag TAG=$(TAG)
	docker push $(IMAGE):$(TAG)


# -------------------------------------------------------------------------------------------------
#  Helper Targets
# -------------------------------------------------------------------------------------------------

enter:
	docker run --rm --name $(subst /,-,$(IMAGE)) -it --entrypoint=bash $(ARG) $(IMAGE)

pull-base-image:
	@docker pull $(shell grep FROM Dockerfile | sed 's/^FROM\s*//g';)
