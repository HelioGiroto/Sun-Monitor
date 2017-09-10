#!/bin/bash
echo
echo

echo " ===================================="
echo "  NÚMERO DE EXPLOSÕES SOLARES GRAVES"
echo "        (Acima de K-index 5)"
echo " ===================================="
echo "	Ano	Explosões"

for ano in $(seq 1994 2017)
do
#	valor=$(cat 1994-2017-Kindex.txt | grep " [5-9]" | awk -v ano="$ano" '{if ($1 == ano) print $0}' | wc -l)
	valor=$(cat 1994-2017-Kindex.txt | grep " [5-9]" | grep $ano | wc -l)
	echo "	"$ano "	"$valor
done 

echo
echo
