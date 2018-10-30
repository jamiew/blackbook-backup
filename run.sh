#!/bin/sh

./download-gml.sh
./download-gson.sh

ipfs add --nocopy --quiet --recursive "data" 2>&1 | tee ipfs-hashes
cat ipfs-hashes | shuf | ./ipfs-gml-cache.sh

ipfs add --nocopy --quiet --recursive "data-json" 2>&1 | tee ipfs-hashes
cat ipfs-hashes | shuf | ./ipfs-gml-cache.sh
