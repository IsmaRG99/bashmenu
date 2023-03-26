#!/bin/bash

#Author: IsmaRG

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"



#Mostramos el menú

menuScript() {
	echo -e "\n${purpleColour}[*]${endColour}${yellowColour}Bienvenido al menú del script${endColour}${purpleColour}[*]${endColour}\n"
	echo -e "\n===============================================\n"
	echo -e "\n${turquoiseColour}[1]${endColour}${grayColour}Metasploit${endColour}\n"
	echo -e "\n${turquoiseColour}[2]${endColour}${grayColour}Dirbuster${endColour}\n"
	echo -e "\n${turquoiseColour}[3]${endColour}${grayColour}nMap${endColour}\n"
	echo -e "\n${turquoiseColour}[4]${endColour}${grayColour}Ofrecer shell a traves de Netcat${endColour}\n"
	echo -e "\n${turquoiseColour}[5]${endColour}${grayColour}Conectar a una shell a traves del Netcat${endColour}\n"
	echo -e "\n${turquoiseColour}[6]${endColour}${grayColour}Salir del script${endColour}\n"
    echo -e "\n===============================================\n"

}

salida=0
while [ $salida -ne 6 ]
do
	menuScript

	echo -e "\n${yellowColour}Por favor, indique el número de la opción que quiere utilizar${endColour}\n"
	read opcion

	case $opcion in
	1)

	        echo -e "\n===============================================\n"
		echo -e "\n${purpleColour}[+]${endColour}Has elegido la opción para usar ${blueColour}Metasploit${endColour}\n"
		echo -e "\n${greenColour}Conectando a Metasploit...${endColour}\n"
		msfconsole
		echo -e "\n${greenColour}Volviendo al menú...${endColour}\n"
		;;

	2)
		echo -e "\n===============================================\n"
                echo -e "\n${purpleColour}[+]${endColour}Has elegido la opción para usar ${blueColour}Dirbuster${endColour}\n"
		echo -e "\n${greenColour}Arrancando Dirbuster...${endColour}\n"
		dirbuster
                echo -e "\n${greenColour}Volviendo al menú...${endColour}\n"
		;;

	3)
                echo -e "\n===============================================\n"
                echo -e "\n${purpleColour}[+]${endColour}Has elegido la opción para usar ${blueColour}nMap${endColour}\n"
		echo -e "\n${yellowColour}Seleccione un tipo de escaneo entre los siguientes de la lista:${endColour}\n"
		echo -e "\n${turquoiseColour}[1]${endColour}${grayColour}Escaneo rápido indicando IP y puerto${endColour}\n"
		echo -e "\n${turquoiseColour}[2]${endColour}${grayColour}Escaneo completo, mostrando versión y lanzando todos los scripts${endColour}\n"
			read escaneo
			case $escaneo in
			1)
				echo -e "\n${yellowColour}Introduzca la IP del objetivo del escaneo${endColour}\n"
				read ip
				echo -e "\n${yellowColour}Introduzca el puerto del objetivo del escaneo${endColour}\n"
				read puertos
				nmap -Pn $ip -p $puertos
				echo -e "\n${greenColour}Escaneo finalizado con éxito${endColour}\n"
				echo -e "\n${yellowColour}¿Quieres volver al menú?(y/n)${endColour}\n"
					read confnmap
					salidanmap=0
					while [ $salidanmap -ne 1 ]
					do
					case $confnmap in
						y)
							echo -e "\n${greenColour}Volviendo al menú...${endColour}\n"
							salidanmap=1
							;;
						n)
							echo -e "\n${yellowColour}Escriba${endColour} ${blueColour}salir${endColour} ${yellowColour}cuando quiera regresar al menú${endColour}\n"
							read backnmap
							case $backnmap in
								salir)
									salidanmap=1
									;;
							esac
							;;
					esac
					done
				echo -e "\n${greenColour}Volviendo al menú...${endColour}\n"
				;;
			2)
                                echo -e "\n${yellowColour}Introduzca la IP del objetivo del escaneo${endColour}\n"
				read ip2
				echo -e "\n${redColour}[!]ATENCIÓN[!]${endColour}${yellowColour}Este escaneo puede tadar un tiempo${endColour}\n"
				nmap -sCV -Pn -p- --min-rate 5000 $ip2
				echo -e "\n${greenColour}Escaneo finalizado con éxito${endColour}\n"
                                echo -e "\n${yellowColour}¿Quieres volver al menú?(y/n)${endColour}\n"
                                        read confnmap2
                                        salidanmap2=0
                                        while [ $salidanmap2 -ne 1 ]
                                        do
                                        case $confnmap2 in
                                                y)
                                                        echo -e "\n${greenColour}Volviendo al menú...${endColour}\n"
                                                        salidanmap2=1
                                                        ;;
                                                n)
                                                        echo -e "\n${yellowColour}Escriba${endColour} ${blueColour}salir${endColour} ${yellowColour}cuando quiera regresar al menú${endColour}\n"
                                                        read backnmap2
                                                        case $backnmap2 in
                                                                salir)
                                                                        salidanmap2=1
                                                                        ;;
                                                        esac
                                                        ;;
                                        esac
                                        done
                                echo -e "\n${greenColour}Volviendo al menú...${endColour}\n"
				;;
			esac
		;;

	4)
                echo -e "\n===============================================\n"
                echo -e "\n${purpleColour}[+]${endColour}Has elegido la opción para usar ${blueColour}ofrecer una shell usando Netcat${endColour}\n"
		echo -e "\n${yellowColour}Indique el puerto en el que quiere ofrecer la shell${endColour}\n"
		read ofrecerpuerto
		echo -e "\n${redColour}[!]ATENCIÓN[!]${endColour} ${yellowColour}Para cortar la shell ofrecida use CTRL+C${endColour}\n"
		echo -e "\n${greenColour}Ofreciendo una shell en el puerto${endColour} ${blueColour}$ofrecerpuerto${endColour}${greenColour}...${endColour}\n"
		nc -n -l -v -p $ofrecerpuerto -c /bin/bash
		echo -e "\n${greenColour}Volviendo al menú...${endColour}\n"
		sleep 5
		;;

	5)
                echo -e "\n===============================================\n"
                echo -e "\n${purpleColour}[+]${endColour}Has elegido la opción para ${blueColour}conectarte a una shell usando Netcat${endColour}\n"
		echo -e "\n${yellowColour}Indique la IP a la que quiere conectarse:${endColour}\n"
		read ipnc
		echo -e "\n${yellowColour}Indique el puerto al que quiere conectarse:${endColour}\n"
		read portnc
                echo -e "\n${redColour}[!]ATENCIÓN[!]${endColour} ${yellowColour}Para cortar la conexión remota use CTRL+C${endColour}\n"
		echo -e "\n${greenColour}Conectando a${endColour} ${blueColour}$ipnc${endColour} ${greenColour}por el puerto ${endColour}${blueColour}$portnc${endColour}${greenColour}...${endColour}\n"
		nc -n -v $ipnc $portnc
                echo -e "\n${greenColour}Volviendo al menú...${endColour}\n"
		sleep 5
		;;

	6)
                echo -e "\n===============================================\n"
		echo -e "\n${redColour}[!]ATENCION[!] ${endColour}Has seleccionado ${redColour}salir${endColour} del script... ${yellowColour}¿Estás seguro? (y/n)${endColour}\n"
		read conf
		salidaconf=0
		while [ $salidaconf -ne 1 ]
		do
		case $conf in
			y)
				echo -e "\n${redColour}Saliendo del script...${endColour}\n"
				salidaconf=1
				salida=6
				;;
			n)
				echo -e "\n${greenColour}Volviendo al menú${endColour}\n"
				salidaconf=1
				;;
			yes)
                                echo -e "\n${redColour}Saliendo del script...${endColour}\n"
				salidaconf=1
                                salida=6
                                ;;
			no)
                                echo -e "\n${greenColour}Volviendo al menú${endColour}\n"
				salidaconf=1
                                ;;
			*)
				echo -e "\n${yellowColour}Por favor, indique una opción válida (y/yes o n/no)${endColour}\n"
				read conf
				;;
		esac
		done

		;;

	*)
		;;
esac

done
