build:
	cabal build all

test:
	cabal test all

lint: lint-haskell lint-shell

lint-haskell:
	just core/ lint
	just scaffolder/ lint
	just specification/ lint

lint-shell:
	@git ls-files "*.sh" | xargs shellcheck -x

doc: ## make doc # Use haddock for producing the codebase documentation
	cabal new-haddock all

code:
	nix develop -c $EDITOR .
