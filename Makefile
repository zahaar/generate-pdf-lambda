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
.DEFAULT_GOAL := all

# ================== Makefile commands ====================
.PHONY: all build zip invokation-local

# all: build

sam-build:
	sam build

invokation-local: sam-build
	sam local invoke "SnapshotFunction" -e events/api-gw-event.json --region us-west-1

api-local: sam-build
	sam local start-api --region us-west-1

get-version: ## Get version of package
	@cat VERSION

################################################################
PROJECT_NAME := "rds_subscriber_sensor_readings"
PKG := "gitlab.com/vitreo-nbt/backend/-/tree/dev/lambdas/rds_subscriber_sensor_readings"
