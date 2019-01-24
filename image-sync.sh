#!/bin/sh
server=$1
[ ! -z $server ] || { echo "Usage: $0 [server]"; exit 1; } && echo "server=$server"

rsync -avz $server:~/blackbook/shared/public/ public/
