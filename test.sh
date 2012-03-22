#!/bin/bash

JASMINE_DIR="`pwd`/node_modules/jasmine-node/bin/"
JASMINE_BIN="jasmine-node"
JASMINE_OPTS="--verbose --color --coffee $* spec/"

echo "Jasmine directory: [ $JASMINE_DIR ] " 
echo "Jasmine binary: [ $JASMINE_BIN ]"
echo "Jasmine options: [ $JASMINE_OPTS ]"
echo
echo "Current directory is " `pwd`

if [ -f $JASMINE_DIR$JASMINE_BIN ]; then
    echo "Jasmine is present."
else
    echo "Jasmine is not present."
fi
echo
echo
echo "----------------------------------------------------------------------"

$JASMINE_DIR$JASMINE_BIN $JASMINE_OPTS

echo "----------------------------------------------------------------------"
