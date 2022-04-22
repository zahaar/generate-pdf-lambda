###############################################################################
#
# @description Commands to setup, develop and deploy the project
# @author Engineering Department <engineering@nbt.ag>
#
###############################################################################
# Make
###############################################################################

SHELL=/bin/bash

ENVIRONMENT=testing

PROJECT_ROOT := $(PWD)


# --- Makefile starts here
.DEFAULT_GOAL := help

# ---- Makefile help utility function
define PRINT_HELP_PYSCRIPT
import re, sys
for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef

export PRINT_HELP_PYSCRIPT

# ================== Makefile commands ====================
.PHONY: help build sam-build invokation-local api-local

help:
	@python3 -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

sam-build: ## Build the SAM template
	sam build

invokation-local: sam-build ## Invoke Lambda locally
	sam local invoke "PdfFunction" -e events/api-gw-event.json --region us-west-1

api-local: sam-build ## Start Local API Gateway
	sam local start-api --region us-west-1

deploy: sam-build ## Deploy SAM template
	sam deploy 

get-version: ## Get version of package
	@cat VERSION

