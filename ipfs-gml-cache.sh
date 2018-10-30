#!/bin/sh

while read hash; do 
  echo $i

  wget -t 2 -T 3 https://ipfs.io/ipfs/$hash -O /dev/null
  wget -t 2 -T 3 https://ipfs.infura.io/ipfs/$hash -O /dev/null
  wget -t 2 -T 3 https://cloudflare-ipfs.com/ipfs/$hash -O /dev/null

  # wget -T 2 https://xmine128.tk/ipfs/$hash -O /dev/null
  # wget -T 2 https://ipfs.jes.xxx/ipfs/$hash -O /dev/null 
  # wget -T 2 https://siderus.io/ipfs/$hash -O /dev/null
  # wget -T 2 https://hardbin.com/ipfs/$hash -O /dev/null

# done < gml-ipfs-hashes
done
