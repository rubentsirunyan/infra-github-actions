#!/usr/bin/env bash

set -e

# fail if INPUT_COMMAND is not set
if [ -z "${INPUT_TARGET}" ]; then
  echo "Required variable \`target\` is missing"
  exit 1
fi

TARGET="make ${INPUT_TARGET}"

if [ -n "${INPUT_WORKING_DIRECTORY}" ]; then
  cd "${INPUT_WORKING_DIRECTORY}"
fi

# assemble operation
if [ -z "${INPUT_ARGUMENTS}" ]; then
  OPERATION="make ${INPUT_TARGET}"
else
  OPERATION="make ${INPUT_TARGET} ${INPUT_ARGUMENTS}"
fi

echo "::debug:: Executing command: ${OPERATION}"

${OPERATION} "${TARGET}"
