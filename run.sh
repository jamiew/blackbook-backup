#!/bin/sh

./download-gml.sh

dir="data-json"
ipfs add --nocopy --quiet --recursive "$dir" 2>&1 | tee ipfs-hashes

cat ipfs-hashes | shuf | ./ipfs-gml-cache.sh
