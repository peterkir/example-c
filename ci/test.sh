#!/bin/bash

# activate bash checks 
# e ~ exit on error, u ~ unset vars, pipe fails
set -eu
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd ) \
  && cd ${SCRIPT_DIR}/..

if [ -v envCompleted ]; then
  echo "skipping env loading"
else
  . ${SCRIPT_DIR}/set-env.sh
fi

headline "### starting proof-of-performance tests for bmi"

echo "### DEBUG START ###"
ls -la .
echo "### DEBUG END ###"

padout "testing"
./bmi < ci/input.txt | grep "BMI liegt bei: 24.97" > /dev/null  && succ "SUCCEEDED" || err "FAILED"

headline "finished testing"
