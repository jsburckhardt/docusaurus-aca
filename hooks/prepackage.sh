#!/bin/bash

set -euo pipefail

# if environment variable RELEASE_VERSION is set use it as DOCKER_TAG
if [ -z ${RELEASE_VERSION+x} ]; then
  echo "RELEASE_VERSION is unset"
  DOCKER_TAG="latest"
else
  echo "RELEASE_VERSION is set to '$RELEASE_VERSION'"
  DOCKER_TAG=$RELEASE_VERSION
fi
azd env set DOCKER_IMAGE_TAG $DOCKER_TAG
