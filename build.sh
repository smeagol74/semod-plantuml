#!/usr/bin/env bash

DIST=./dist
SRC=./src

function build() {
  SCRIPT=$1
  PARTS=$(cat ${SRC}/${SCRIPT} | sed 's/!include //')
  touch ${DIST}/${SCRIPT}
  for PART in ${PARTS}; do
    cat ${SRC}/${PART} >> ${DIST}/${SCRIPT}
    echo '' >> ${DIST}/${SCRIPT}
    echo '' >> ${DIST}/${SCRIPT}
  done
}

rm -rf ${DIST}
mkdir ${DIST}

build semod.iuml
build archimate.iuml
build system.iuml
build ontology.iuml
build essence.iuml
