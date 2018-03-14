#!/bin/bash
clear
# Últimos dados do NOAA sobre explosões solares:
echo; echo "Último Kindex:"
curl -s 'http://services.swpc.noaa.gov/products/noaa-planetary-k-index.json' | jq '.[-1:][0][0,1]'

site='ftp://ftp.swpc.noaa.gov/pub/lists/xray/Gp_xr_1m.txt'

echo; echo "Últimas explosões solares:"
curl -s ${site} | tail 
# curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/Gs_xr_1m.txt | tail 
echo

# echo "Maiores explosões de hoje:"
# curl -s ${site} | sort -nrk 8 | head 

echo "Maiores explosões de hoje:"
for expoente in $(seq 1 9)		# Percorre as explosões das mais fortes às mais fracas: -01 até -09
do
	curl -s ${site} | grep e-0${expoente}$ > /dev/null		
	if [[ $? -eq 0 ]] 										# Pergunta se tem ocorrência do GREP acima
	then
		curl -s ${site} | grep e-0${expoente}$ | sort -nrk 8 | head 		#Se tenha, imprime em ordem núm. descrescente
		break 														# e simplesmente sai.
	fi
done

# TENTE ESSAS DUAS LINHAS ABAIXO:
# site=ftp://ftp.swpc.noaa.gov/pub/lists/xray/20170910_Gp_xr_1m.txt
# for expoente in $(seq 1 9); do curl -s ${site} | grep e-0${expoente}$ > /dev/null; if [[ $? -eq 0 ]] ; then curl -s ${site} | grep e-0${expoente}$ | sort -nrk 8 | head; break; fi; done


# curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/Gs_xr_1m.txt | sort -nrk 7 | head 
# curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/Gp_xr_1m.txt | grep 'e-0[7|6]$'

# Baseie-se nisso:
# echo; echo "EXPLOSOES SOLARES EM SETEMBRO/2017 acima de e-04"; for i in $(echo {01..23}); do echo -n "$i - "; curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/201709${i}_Gp_xr_1m.txt | grep 'e-0[4]$' | wc -l; done

# curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/Gp_xr_1m.txt | grep 'e-0[7|8]$'


# Ordem dos mais altos (de 10^-8):
# curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/Gp_xr_1m.txt | grep 'e-0[8]$' | sort -nrk 8 | head


# Pergunta: TEVE DE 7 ???? (Se resposta é 1, é pq não teve):
# curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/Gp_xr_1m.txt | grep 'e-0[7]$' > /dev/null ; echo $?


# curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/Gp_xr_1m.txt | grep 'e-0[8]$' > /dev/null; echo $?
# 0 		# Sim teve de 10^-8

# Para fazer um ALERTA SOLAR basta pegar a última linha desse arquivo:
# curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/Gp_xr_1m.txt | tail -n1

# ... e em seguida verificamos SE o último caracter é < 7 (,6,5,4,3) etc.  SE SIM, manda alerta, SE NÃO, CONTINUA varrendo.
# sol=$(curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/Gp_xr_1m.txt | tail -n1)
# echo $sol | grep 7$; [[ $? -eq 0 ]] && echo "EXPLOSÃO > 7" || echo NADA		# esse sai tb o último registro!
# ou
# echo $sol | grep 8$ > /dev/null; [[ $? -eq 0 ]] && echo "EXPLOSÃO > 8" || echo NADA


# echo; echo "EXPLOSOES SOLARES EM SETEMBRO/2017 acima de e-04"; for i in $(echo {01..23}); do echo -n "$i - "; curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/201709${i}_Gp_xr_1m.txt | grep 'e-0[4]$' | wc -l; done


# ----------------------------------------------------------------------------------------

# Video e fotos:
curl -s http://services.swpc.noaa.gov/images/swx-overview-small.gif | display &
curl -s http://services.swpc.noaa.gov/images/planetary-k-index.gif | display &
curl -s http://legacy-www.swpc.noaa.gov/rt_plots/XrayBL.gif | display &
chromium-browser https://satdat.ngdc.noaa.gov/sxi/archive/browse/special/sxi_g15_latest_01day.mp4 &>/dev/null &

#dia=$(date +%Y%m%d)
#curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/${dia}_Gs_xr_1m.txt | sort -nrk 7 | head 

# ORDENAR POR MEDIDA DA EXPLOSÃO: 
# curl -s ftp://ftp.swpc.noaa.gov/pub/lists/xray/20180217_Gs_xr_1m.txt | sort -nrk 7 | head 

# Todo o JSON de Kindex:
# curl -s 'http://services.swpc.noaa.gov/products/noaa-planetary-k-index.json' | jq .

# Todos os últimos valores Kindex - somente os valores:
# curl -s 'http://services.swpc.noaa.gov/products/noaa-planetary-k-index.json' | jq .[][1] | xargs

