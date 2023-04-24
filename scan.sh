#!/bin/bash

# Author: BUGHUNT3Rar

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

if [ $(id -u) -ne 0 ]; then
    echo -e "${redColour}[-] No soy root${endColour}"
    exit
fi

test -f /usr/bin/nmap

if [ "$(echo $?)" == "0" ];then
    clear
read -p "Introducir IP: " ip

while true; do
    echo -e "\n${purpleColour}1)${endColour}${yellowColour}Escaneo rapido pero intrusivo${endColour}"
    echo -e "${purpleColour}2)${endColour}${yellowColour}Escaneo normal${endColour}"
    echo -e "${purpleColour}3)${endColour}${yellowColour}Escaneo silencioso${endColour}${redColour}(Puede tardar varios minutos)${endColour}"
    echo -e "${purpleColour}4)${endColour}${yellowColour}Escaneo de servicios y versiones${endColour}"
    echo -e "${purpleColour}5)${endColour}${yellowColour}Escaneo de vulnerabilidades${endColour}"
    echo -e "${purpleColour}6)${endColour}${yellowColour}Salir${endColour}"
    read -p "Seleccionar una opciòn: " opcion
    case $opcion in

1)
    clear && echo -e "${turquoiseColour}Escaneando...${endColour}" && nmap -p- --open --min-rate 5000 -T5 -sS -Pn -n -v $ip > escaneo_intrusivo.txt && echo -e "${greenColour}Escaneo guardado en el fichero escaneo_intrusivo.txt${endColour}"
    exit
    ;;
2)
    clear && echo -e "${turquoiseColour}Escaneando...${endColour}" && nmap -p- --open $ip > escaneo_normal.txt && echo -e "${greenColour}Escaneo guardado en el fichero escaneo_normal.txt${endColour}"
    exit
    ;;
3)
    clear && echo -e "${turquoiseColour}Escaneando...${endColour}" && nmap -p- -T2 -sS -Pn -f $ip > escaneo_silencioso.txt && echo -e "${greenColour}Escaneo guardado en el fichero escaneo_silencioso.txt${endColour}"
    exit
    ;;
4)
    clear && echo -e "${turquoiseColour}Escaneando...${endColour}" && nmap -sV -sC $ip > escaneo_servicios.txt && echo -e "${greenColour}Escaneo guardado en el fichero escaneo_servicios.txt${endColour}"
    exit
    ;;
5)
    clear && echo -e "${turquoiseColour}Escaneando...${endColour}" && nmap --script vuln $ip > escaneo_vulnerabilidades.tx && echo -e "${greenColour}Escaneo guardado en el fichero escaneo_vulnerabilidades.txt${endColour}"
    exit
    ;;
6)
    break
    ;;
*)
    echo -e "${redColour}[-] No se ha encontrado ningun paràmetro introduzca un valor correcto${endColour}"
    ;;
    esac
done

else
    echo -e "\n${redColour}[-] Nmap no esta instalado$e{endColour}" && apt install nmap -y > /dev/null && echo -e "${greenColour}[+] Nmap se ha instalado sin problemas${endColour}"
fi