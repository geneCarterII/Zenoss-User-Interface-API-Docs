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
jsduck  --title "Zenoss User Interface API documentation" --images=ext-4.0.5/docs/doc-resources/ ext-4.0.5/src core --guides guides.json -o $OUTPUT