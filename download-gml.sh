#!/bin/sh

dir="./data-json"
mkdir -p $dir

# i=59
# i=55500
i=129
empty_files=0
while [ 1 ]; do

  i=$((i + 1))
  echo $i

  outfile="$dir/$i.json"

  if [ -f "$outfile" ]; then
    echo "Already here, skipping"
    continue
  fi

  wget "http://000000book.com/data/$i.json" -O "$outfile" && empty_files=0
  # wget "http://000000book.com/data/$i.json" -O "$outfile"

  if [ ! -s "$outfile" ] ; then
    echo "$outfile is empty, deleting..."
    rm "$outfile"
    empty_files=$((empty_files + 1))
    # exit 0
  fi

  echo "empty_files = $empty_files"
  if [ $empty_files -gt 10 ]; then
    echo "More than 10 empty files, calling it a day"
    exit 0
  fi

  sleep 0.5

done
