#!/bin/bash

clear_screen() {
    clear
}

loading_dots_left_to_right() {
    duration=$1
    max_dots=5
    end=$((SECONDS + duration))
    i=0
    while [ $SECONDS -lt $end ]; do
        pos=$(( i % (max_dots * 2) ))
        dots=""
        if [ $pos -lt $max_dots ]; then
            for ((j=0; j<=pos; j++)); do dots+="."; done
            for ((j=pos+1; j<max_dots; j++)); do dots+=" "; done
        else
            empty_count=$((pos - max_dots + 1))
            for ((j=0; j<empty_count; j++)); do dots+=" "; done
            for ((j=empty_count; j<max_dots; j++)); do dots+="."; done
        fi
        echo -ne "\rMemproses data $dots"
        sleep 0.3
        ((i++))
    done
    echo -ne "\r                              \r"
}

loading_progress() {
    for i in $(seq 0 100); do
        echo -ne "\rLoad UI: $i%"
        sleep 0.03
    done
    echo -ne "\r                    \r"
}

welcome_ascii="
                __                              __      
 _      _____  / /________  ____ ___  ___      / /_____ 
| | /| / / _ \/ / ___/ __ \/ __ \`__ \/ _ \    / __/ __ \\
| |/ |/ /  __/ / /__/ /_/ / / / / / /  __/   / /_/ /_/ /
|__/|__/\___/_/____/\____/_/ ___ __/\___/    \__/\____/ 
   __  _____  / /______ _   / (_) /_  ____ ________  __ 
  / / / / _ \/ //_/ __ \`/  / / / __ \/ __ \`/ ___/ / / / 
 / /_/ /  __/ ,< / /_/ /  / / / /_/ / /_/ / /  / /_/ /  
 \__, /\___/_/|_|\__,_/  /_/_/_.___/\__,_/_/   \__, /   
/____/                                        /____/    
"

header_text="=== Welcome to Yeka Library ==="

show_menu() {
    echo -e "\e[36m$header_text\e[0m"
    echo -e "\e[33m\nPilih Menu Learning:\e[0m"
    echo -e "\e[36m------------------------------------\n\e[0m"
    echo "1. Cybersec Learning"
    echo "2. Webdev Learning"
    echo "3. Business Learning"
    echo "4. AI Learning"
    echo "5. Bot"
    echo "6. Exit"
    echo -e "\e[36m------------------------------------\n\e[0m"
}

menu_action() {
    choice=$1
    if [[ "$choice" =~ ^[1-5]$ ]]; then
        clear_screen
        echo -e "\e[36m$header_text\e[0m"
        echo -e "\e[32mOn going...\n\e[0m"
        read -p "Tekan Enter untuk kembali ke menu utama..."
    elif [ "$choice" == "6" ]; then
        echo -e "\e[31m\nKeluar dari program. Terima kasih!\e[0m"
        exit 0
    else
        echo -e "\e[31mPilihan tidak valid. Silakan coba lagi.\e[0m"
        sleep 1
    fi
}

main_menu_loop() {
    while true; do
        clear_screen
        echo -e "$welcome_ascii"
        show_menu
        read -p "Masukkan pilihan (1-6): " choice
        menu_action "$choice"
    done
}

main() {
    clear_screen
    loading_dots_left_to_right 5
    loading_progress
    main_menu_loop
}

main
