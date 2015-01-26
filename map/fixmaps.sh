#!/bin/bash

# Crop the map images that are output from the MapMaker Processing script.

for f in MapMaker/map??.png ; do
    OUT=`echo $f | sed 's/MapMaker\//.\//'`
    echo "$f => $OUT"
    convert -crop 877x500+95+0 $f $OUT
done
