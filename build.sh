#!/usr/bin/env bash

DIST=./dist
SRC=./src

function build() {
  SCRIPT=$1
  DEST=$2
  PARTS=$(cat ${SRC}/${SCRIPT} | sed 's/!include //')
  touch ${DIST}/${DEST}
  for PART in ${PARTS}; do
    cat ${SRC}/${PART} >> ${DIST}/${DEST}
    echo '' >> ${DIST}/${DEST}
    echo '' >> ${DIST}/${DEST}
  done
}

rm -rf ${DIST}
mkdir ${DIST}

build semod.iuml semod.puml
build archimate.iuml archimate.puml
build system.iuml system.puml
build ontology.iuml ontology.puml
build essence.iuml essence.puml
