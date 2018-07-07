#!/bin/sh

./download-gml.sh && ipfs add -q -r data 2>&1 | tee ipfs-hashes && cat ipfs-hashes | ./ipfs-gml-cache.sh
