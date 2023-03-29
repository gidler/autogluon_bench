#!/bin/bash

set -ex

source $(dirname "$0")/env_setup.sh

setup_build_env

black --check --diff src/
isort --check --diff src/