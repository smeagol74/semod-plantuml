#!/usr/bin/env bash

NAME=$1

function export {
  SRC=$1
  DST=$2
  inkscape --export-file=${DST}.png --export-background-opacity=0 --without-gui ${SRC}
}

function mkColored {
  SRC=$1
  DST=$2
  BG=$3
  BORDER=$4
  cat ${SRC}.svg | sed "s/\"#f2f2f2\"/\"#${BG}\"/g" | sed "s/\"#6e6e6e\"/\"#${BORDER}\"/g" > ${DST}
}

function exportColored {
  SRC=$1
  SUFFIX=$2
  BG=$3
  BORDER=$4
  TMP=$(mktemp --suffix .svg)
  mkColored ${SRC} ${TMP} ${BG} ${BORDER}
  export ${TMP} ${SRC}_${SUFFIX}
}

CUSTOMER_BG=c9ffc9
CUSTOMER_BORDER=40a94c
SOLUTION_BG=ff9
SOLUTION_BORDER=ea7502
ENDEAVOR_BG=c6d9f1
ENDEAVOR_BORDER=4b6ec6

echo "process ${NAME}.svg"

export ${NAME}.svg ${NAME}
exportColored ${NAME} customer ${CUSTOMER_BG} ${CUSTOMER_BORDER}
exportColored ${NAME} solution ${SOLUTION_BG} ${SOLUTION_BORDER}
exportColored ${NAME} endeavor ${ENDEAVOR_BG} ${ENDEAVOR_BORDER}
