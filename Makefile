STACK_ROOT ?= "${HOME}/.stack"

build:
	stack --stack-root "${STACK_ROOT}" build

test:
	stack --stack-root "${STACK_ROOT}" test

lint: lint-haskell lint-shell

lint-haskell:
	$(MAKE) -C core lint
	$(MAKE) -C scaffolder lint
	$(MAKE) -C specification lint

lint-shell:
	@git ls-files "*.sh" | xargs shellcheck -x

doc: ## make doc # Use haddock for producing the codebase documentation
	stack --no-haddock-deps --stack-root "${STACK_ROOT}" haddock

doc-publish: doc ## make doc-publish # Build and publish generated haddock
	./scripts/documentation-versioning.sh "${WWW}" "${COMMIT_TAG}" '$(shell stack --stack-root "${STACK_ROOT}" path --local-doc-root)'

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
.PHONY: test lint doc help
