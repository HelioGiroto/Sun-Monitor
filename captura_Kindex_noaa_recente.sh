#!/bin/bash

# CAPTURA DADOS RECENTES

echo "Quantos dias recentes?"
read nro

curl -s ftp://ftp.swpc.noaa.gov/pub/indices/old_indices/2017Q3_DGD.txt | tail -n$nro | awk '{print $1" "$2" "$3" "$23" "$24" "$25" "$26" "$27" "$28" "$29" "$30}'



