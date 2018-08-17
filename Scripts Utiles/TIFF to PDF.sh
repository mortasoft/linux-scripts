#!/bin/bash
for entry in *
do
  tiff2pdf -o "$entry.pdf" "$entry"
  #echo "$entry"
done
rm *.tif
