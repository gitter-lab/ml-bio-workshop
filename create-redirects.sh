#!/bin/bash

echo Creating redirect for...
# Strip trailing whitespace
for PAGE in $(cat site-map.txt | sed "s/[[:space:]]*$//"); do
  echo $PAGE
  # Create output directory if needed
  # Will attempt to create '.', which is unnecessary but harmless
  mkdir -p $(dirname "$PAGE")
  # Use '@' as delimiter because the paths contain '/'
  sed "s@{{PAGE}}@$PAGE@g" redirect-template.html > $PAGE
done
