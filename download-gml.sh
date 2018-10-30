#!/bin/sh

dir="./data"
mkdir -p $dir

# i=59
# i=55500
# i=129
i=56300
empty_files=0
while [ 1 ]; do

  i=$((i + 1))
  echo $i

  outfile="$dir/$i.gml"

  if [ -f "$outfile" ]; then
    echo "Already here, skipping"
    empty_files=0
    continue
  fi

  wget "http://000000book.com/data/$i.gml" -O "$outfile" && empty_files=0

  if [ ! -s "$outfile" ] ; then
    echo "$outfile is empty, deleting..."
    rm "$outfile"
    empty_files=$((empty_files + 1))
    # exit 0
  fi

  echo "empty_files = $empty_files"
  empty_file_limit=30
  if [ $empty_files -gt $empty_file_limit ]; then
    echo "More than $empty_file_limit empty files, calling it a day"
    exit 0
  fi

  sleep 0.5

done
