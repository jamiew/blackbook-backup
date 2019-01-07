#!/bin/sh

./download-gml.sh
./download-gson.sh

ipfs add --nocopy --quiet --recursive "data" 2>&1 | tee ipfs-hashes-gml
ipfs add --nocopy --quiet --recursive "data-json" 2>&1 | tee ipfs-hashes-json

# cat ipfs-hashes-gml | shuf | ./ipfs-gml-cache.sh
# cat ipfs-hashes-json | shuf | ./ipfs-gml-cache.sh

# TODO capture the output of either data/ or data-json/ and publish to IPNS
