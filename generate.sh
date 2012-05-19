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
jsduck  --title "Zenoss User Interface API documentation" --builtin-classes --welcome=index.html --head-html='<link rel="stylesheet" href="style.css" type="text/css">'  --images=extjs-4.1.0/docs/images extjs-4.1.0/src core --guides guides.json -o $OUTPUT
# make sure the style css file gets there
cp style.css $OUTPUT
cp favicon.ico $OUTPUT
