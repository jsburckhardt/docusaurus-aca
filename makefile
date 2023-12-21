ifdef RELEASE
	DOCS_VERSION := $(RELEASE)
else
	DOCS_VERSION := latest
endif

ifdef REGISTRY
	REPO := $(REGISTRY).azurecr.io/
else
	REPO :=
endif

lint:
	npx markdownlint "src/docusaurus/docs/**/*.md"
	npx markdownlint "README.md"

spellcheck:
	npx cspell "src/docusaurus/docs/**/*.md"
	npx cspell README.md

fix-lint:
	@npx markdownlint --fix "src/docusaurus/docs/**/*.md"
	@npx markdownlint --fix "README.md"

.ONESHELL:

docs:
	cd src/docusaurus
	npx docusaurus start --host 0.0.0.0
