#!/bin/bash

sudo apt-get install -y jq
sed -i 's/^sudo/#sudo/; s/^sed/#sed/'

kindex=$(curl -s 'http://services.swpc.noaa.gov/products/noaa-planetary-k-index.json' | jq '.[-1][1]' | sed 's/"//g')

if [[ "$kindex" -gt "4" ]]
then
	echo "Alerta! Explosão solar com K-index de:" $kindex
	sleep 2
	firefox http://services.swpc.noaa.gov/images/planetary-k-index.gif
else
	echo "NORMAL:" $kindex
	sleep 2
	firefox http://services.swpc.noaa.gov/images/planetary-k-index.gif
fi







