#!/bin/sh

while [ "$response" != "0" ]
do
    clear
    printf "\e[38;5;6m#########################################\n"
    printf "\e[38;5;6m## GESTOR DE CONEXIONES SSH ##\n"
    printf "\e[38;5;6m#########################################\n"
    echo ""
    printf "\e[38;5;6mListado de entornos disponibles:\n"      
    printf "\e[38;5;6m--------------------------------\n"
    printf "\e[38;5;12m0.   {nombre_de_proyecto} - Dev\n"
    printf "\e[38;5;11m1.   {nombre_de_proyecto} - Pre\n"
    printf "\e[38;5;9m2.   {nombre_de_proyecto} - Pro\n"
    echo ""
    printf "\e[38;5;13m0. Salir\n"
    printf "\e[38;5;6m\n"
    
    read -p "Indica el entorno al que quieres conectarte: " response

    tput init   
    
    if [ $response = 0 ];
    then
        echo "Operación cancelada. Saliendo de la aplicación..."
        exit    
    fi
    
    if [ $response = 1 ];
    then
        eval `ssh-agent -s` &>/dev/null
        
        #    Si el entorno usa clave PEM usar estas líneas
        echo "Cargando PEM de {nombre_de_proyecto}..."    
        ssh-add ~/.ssh/{archivo_pem}
        
        #   Si el entorno no usa clave PEM usar estas líneas
        ssh-add ~/.ssh/id_rsa
        
        ssh-add &>/dev/null        
        echo "Conectando con {nombre_de_proyecto} - {entorno}..."
        echo ""
        ssh -A {usuario}@{ip_maquina}
    elif [ $response = 3 ];
    then
        # Repetir líneas del IF anterior o eliminar este bloque ELSEIF
    else
        echo "¡Opción incorrecta!"    
    fi
    
done
