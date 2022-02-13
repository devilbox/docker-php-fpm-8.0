ifneq (,)
.error This Makefile requires GNU Make.
endif


# -------------------------------------------------------------------------------------------------
# Docker configuration
# -------------------------------------------------------------------------------------------------

DIR = .
FILE = Dockerfile
IMAGE = devilbox/php-fpm-8.0
TAG = latest
ARCH = linux/amd64
NO_CACHE =


# -------------------------------------------------------------------------------------------------
#  Default Target
# -------------------------------------------------------------------------------------------------
.PHONY: help
help:
	@echo "lint                      Lint project files and repository"
	@echo
	@echo "build                     Build Docker image"
	@echo "rebuild                   Build Docker image without cache"
	@echo
	@echo "manifest-create           Create multi-arch manifest"
	@echo "manifest-push             Push multi-arch manifest"
	@echo
	@echo "test                      Test built Docker image"
	@echo "update-readme             Update README.md with PHP modules"
	@echo
	@echo "tag [TAG=...]             Retag Docker image"
	@echo "login USER=... PASS=...   Login to Docker hub"
	@echo "push [TAG=...]            Push Docker image to Docker hub"


# -------------------------------------------------------------------------------------------------
#  Lint Targets
# -------------------------------------------------------------------------------------------------
.PHONY: lint
lint: lint-workflow

.PHONY: lint-workflow
lint-workflow:
	@\
	GIT_CURR_MAJOR="$$( git tag | sort -V | tail -1 | sed 's|\.[0-9]*$$||g' )"; \
	GIT_CURR_MINOR="$$( git tag | sort -V | tail -1 | sed 's|^[0-9]*\.||g' )"; \
	GIT_NEXT_TAG="$${GIT_CURR_MAJOR}.$$(( GIT_CURR_MINOR + 1 ))"; \
	grep 'refs:' -A 20 .github/workflows/nightly.yml \
	| grep '^          -' \
	| grep -v master \
	| while read -r i; do \
		if ! echo "$${i}" | grep -- "- '$${GIT_NEXT_TAG}'" >/dev/null; then \
			echo "[ERR] New Tag required in .github/workflows/nightly.yml: $${GIT_NEXT_TAG}"; \
			exit 1; \
		else \
			echo "[OK] Git Tag present in .github/workflows/nightly.yml: $${GIT_NEXT_TAG}"; \
		fi \
	done


# -------------------------------------------------------------------------------------------------
#  Build Targets
# -------------------------------------------------------------------------------------------------
.PHONY: build
build:
	docker build --platform=$(ARCH) $(NO_CACHE) -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)

.PHONY: rebuild
rebuild: NO_CACHE=--no-cache
rebuild: pull-base-image
rebuild: build


# -------------------------------------------------------------------------------------------------
#  Manifest Targets
# -------------------------------------------------------------------------------------------------
.PHONY: manifest-create
manifest-create:
	@echo "docker manifest create \
		$(IMAGE):$(TAG) \
		$$( echo $(ARCH) | sed 's/,/ /g' | sed 's|/|-|g' | xargs -n1 sh -c 'printf -- " --amend $(IMAGE):$(TAG)-manifest-$${1}"' -- )" \
	| sed 's/\s\s*/ /g' \
	| sed 's/--/\\\n  --/g'
	@echo "docker manifest create \
		$(IMAGE):$(TAG) \
		$$( echo $(ARCH) | sed 's/,/ /g' | sed 's|/|-|g' | xargs -n1 sh -c 'printf -- " --amend $(IMAGE):$(TAG)-manifest-$${1}"' -- )" \
	| bash

.PHONY: manifest-push
manifest-push:
	docker manifest push $(IMAGE):$(TAG)


# -------------------------------------------------------------------------------------------------
#  Test Targets
# -------------------------------------------------------------------------------------------------
.PHONY: test
test:
	./tests/test.sh $(IMAGE) $(ARCH)

.PHONY: update-readme
update-readme:
	cat "./README.md" \
		| perl -0 -pe "s/<!-- modules -->.*<!-- \/modules -->/<!-- modules -->\n$$(./tests/get-modules.sh $(IMAGE) $(ARCH))\n<!-- \/modules -->/s" \
		> "./README.md.tmp"
	yes | mv -f "./README.md.tmp" "./README.md"


# -------------------------------------------------------------------------------------------------
#  Deploy Targets
# -------------------------------------------------------------------------------------------------
.PHONY: tag
tag:
	docker tag $(IMAGE) $(IMAGE):$(TAG)

.PHONY: login
login:
	yes | docker login --username $(USER) --password $(PASS)

.PHONY: push
push:
	@$(MAKE) tag TAG=$(TAG)
	docker push $(IMAGE):$(TAG)

.PHONY: push-arch
push-arch:
	$(MAKE) tag TAG=$(TAG)-manifest-$(subst /,-,$(ARCH))
	docker push $(IMAGE):$(TAG)-manifest-$(subst /,-,$(ARCH))


# -------------------------------------------------------------------------------------------------
#  Helper Targets
# -------------------------------------------------------------------------------------------------
.PHONY: enter
enter:
	docker run --rm --platform=$(ARCH) -it --entrypoint=bash $(ARG) $(IMAGE)

.PHONY: pull-base-image
pull-base-image:
	@docker pull $(shell grep FROM Dockerfile | sed 's/^FROM\s*//g';)
