#!/bin/sh
#server=$1
#[ ! -z $server ] || { echo "Usage: $0 [server]"; exit 1; } && echo "server=$server"

# rsync -avz $server:~/blackbook-backup/data/ data/
# rsync -avz $server:~/blackbook-backup/data-json/ data-json/

./download-gml.sh
./download-gson.sh

echo "Latest 5 in data/:"
ls -ltrh data | tail -n 5

echo "Latest 5 in data-json/:"
ls -ltrh data-json | tail -n 5

echo -n "data/ count:"
ls -ltrh data | wc -l

echo -n "data-json/ count:"
ls -ltrh data-json | wc -l

echo
echo "compare-data-backups.rb ..."
ruby compare-data-backups.rb

