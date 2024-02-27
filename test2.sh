#!/bin/sh
fruits_file=`cat fruits | grep -i ap*le | xargs | wc -wl`
echo "output: $fruits_file"

