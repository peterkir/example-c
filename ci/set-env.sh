#!/bin/bash
# activate bash checks for unset vars, pipe fails
set -eauo pipefail
# locate script folder and set working directory
SCRIPT_DIR="$( cd $( dirname ${BASH_SOURCE[0]} ) >/dev/null 2>&1 && pwd )" \
  && cd ${SCRIPT_DIR}/..

NC='\033[0m' # no color
BLUE='\033[0;34m';
RED='\e[31m';
GREEN='\e[42m';
headline() {
  if [ -t 1 ]; then # identify if stdout is terminal
    echo -ne "${BLUE}#\n# $1\n#\n${NC}"
  else
    echo -ne "#\n# $1\n#\n"
  fi
}
padout() {
  if [ -t 1 ]; then # identify if stdout is terminal
    printf -v x '%-60s' "$1"; echo -ne "${BLUE}$(date +%H:%M:%S) $x${NC}"
  else
    printf -v x '%-60s' "$1"; echo -ne "$(date +%H:%M:%S) $x"
  fi
}
err() {
  if [ -t 1 ]; then # identify if stdout is terminal
    echo -e " - ${RED}FAILED${NC}"
  else
    echo -e " - FAILED"
  fi
}
succ() {
  if [ -t 1 ]; then # identify if stdout is terminal
    echo -e " - ${GREEN}SUCCESS${NC}"
  else
    echo -e " - SUCCESS"
  fi
}

headline "existing environment"
env | sort

FILE_ENV=${SCRIPT_DIR}/../env.prop
_BRANCH=${BUILD_SOURCEBRANCH:=$(git rev-parse --abbrev-ref HEAD)}

envCompleted=true
