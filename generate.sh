#!/bin/bash

OUTPUT=$1

if [ -z "$OUTPUT" ]; then
    echo "Invalid output directory provided"
    echo "Usage: ./generate.sh OutputDirectory"
    exit
fi

# link the core js here
if [ ! -h core ]; then
    ln -s $ZENHOME/Products/ZenUI3/browser/resources/js/zenoss core
fi
jsduck  --title "Zenoss User Interface API documentation" --builtin-classes  --images=ext-4.0.7-gpl/docs/doc-resources/ ext-4.0.7-gpl/src core --guides guides.json -o $OUTPUT