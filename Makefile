.PHONY: help install-core install-json install-yaml install-xml install-csv install-properties install-all install-tools

help: ## Print available targets
	@printf "Shape Ecosystem — available targets:\n\n"
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ { printf "  %-20s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

install-core: ## Install shape-core (parser infrastructure)
	go get github.com/shapestone/shape-core

install-json: ## Install shape-json (JSON parser)
	go get github.com/shapestone/shape-json

install-yaml: ## Install shape-yaml (YAML parser)
	go get github.com/shapestone/shape-yaml

install-xml: ## Install shape-xml (XML parser)
	go get github.com/shapestone/shape-xml

install-csv: ## Install shape-csv (CSV parser)
	go get github.com/shapestone/shape-csv

install-properties: ## Install shape-properties (Properties parser)
	go get github.com/shapestone/shape-properties

install-all: install-core install-json install-yaml install-xml install-csv install-properties ## Install all parser libraries

install-tools: ## Install all validator command-line interface (CLI) tools
	go install github.com/shapestone/shape-json/cmd/shape-jsonv@latest
	go install github.com/shapestone/shape-yaml/cmd/shape-yamlv@latest
	go install github.com/shapestone/shape-xml/cmd/shape-xmlv@latest
	go install github.com/shapestone/shape-csv/cmd/shape-csvv@latest
