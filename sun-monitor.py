#!/usr/bin/python3
#-*- coding: utf-8 -*-

print("começando...")
import requests, json

endereco = "http://services.swpc.noaa.gov/products/noaa-planetary-k-index.json"

pagina = requests.get(endereco)
texto = pagina.text
arqjson = json.loads(texto)


kindex = arqjson[-1][1]

print()
print("Último registro:", arqjson[-1])
print()
print("Último K-index:", kindex)
