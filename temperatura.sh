#!/usr/bin/env bash
#
# 
#
# Autor:      Eric Gonçalves
#
# ------------------------------------------------------------------------ #

# ------------------------------PAISES--------------------------------- #
curl -l -s "api.weatherapi.com/v1/current.json?key=d2554df21279484a906172711211611&q=London&aqi=no" > london.json
curl -l -s "api.weatherapi.com/v1/current.json?key=d2554df21279484a906172711211611&q=rome&aqi=no" > rome.json
curl -l -s "api.weatherapi.com/v1/current.json?key=d2554df21279484a906172711211611&q=dubai&aqi=no" > dubai.json
curl -l -s "api.weatherapi.com/v1/current.json?key=d2554df21279484a906172711211611&q=Sao_Paulo&aqi=no" > saopaulo.json
# ------------------------------- VARIÁVEIS ----------------------------------------- #


MENSAGEM_USO="
  $(basename $0) - [OPCOES]
  Exemplo de uso: 
  
  ./tempo.sh -london - Exibe a temperatura atual em Londres 
  ./tempo.sh -dubai - Exibe a temperatura atual em Dubai
"

DUBAI=0
ROME=0
LONDON=0
SP=0

while test -n "$1"
do
    case "$1" in
    -h) echo "$MENSAGEM_USO" && exit 0                                            ;;
    -dubai) DUBAI=1                                                               ;;
    -rome) ROME=1                                                                 ;;
    -london) LONDON=1                                                             ;;
    -sampa) SP=1                                                                  ;;  
 
 #    *) echo "Opção inválida, use -h para ajuda." && exit 1 ;;
    esac
    shift
done    

[ $DUBAI -eq 1    ] && TEMPERATURA=$(jq '.["current"]' dubai.json | jq '.temp_c') && LUGAR=Dubai
[ $ROME -eq 1     ] && TEMPERATURA=$(jq '.["current"]' rome.json | jq '.temp_c') && LUGAR=Roma
[ $LONDON -eq 1   ] && TEMPERATURA=$(jq '.["current"]' london.json | jq '.temp_c') && LUGAR=Londres
[ $SP -eq 1       ] && TEMPERATURA=$(jq '.["current"]' saopaulo.json | jq '.temp_c') && LUGAR=Sao_Paulo


echo A temperatura em $LUGAR neste momento é de $TEMPERATURA graus celsius.

