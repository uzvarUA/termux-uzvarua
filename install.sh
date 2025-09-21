#!/data/data/com.termux/files/usr/bin/bash

clear
echo -e "\e[1;32m🌟 UzvarUa — Bash Меню\e[0m"
echo "🔧 Виберіть модуля:"
echo "0️⃣ Встановлення bc"
echo "1️⃣ Оновлення пакетів"
echo "2️⃣ Встановлення proot python tur-repo"
echo "3️⃣ Встановлення thc-hydra make mandoc"
echo "4️⃣ Встановлення libjpeg-turbo libpng zlib"
echo "5️⃣ Встановлення openssh rust"
echo "6️⃣ Встановлення ffmpeg"
echo "7️⃣ Встановлення yt-dlp"
echo "8️⃣ Вийти"
echo "9️⃣ Встановлення findutils та which"
echo "🔟 Відео монтаж"
echo "1️⃣1️⃣ Встановлення cURL та jq"
echo "1️⃣2️⃣ Завантажити із Reddit"
echo "1️⃣3️⃣ Тікток"
echo "1️⃣4️⃣ Інформація"
echo "1️⃣5️⃣ Визначення архітектури Android-пристрою"
echo "1️⃣6️⃣ Встановлення x11-repo"
echo "1️⃣7️⃣ Запуск X11 сервер і XFCE4 сесію"
echo "1️⃣8️⃣ Створення запуску Termux-11 з XFCE4…"
echo "1️⃣9️⃣ Встановлення Maigret"
echo "2️⃣0️⃣ Встановлення Mr. Holmes"
echo "2️⃣1️⃣ Запуск Mr. Holmes"
echo "2️⃣2️⃣ Встановлення asciinema"
echo "2️⃣3️⃣ UzvarUA UUID & manifest.json генератор"

# Функція перевірки та запуску
run_script() {
    local path="$1"
    if [ -f "$path" ]; then
        echo -e "\e[1;34m▶ Запуск: $path\e[0m"
        bash "$path"
    else
        echo -e "\e[1;31m❌ Модуль не знайдено: $path\e[0m"
    fi
}

read -p "👉 Виберіть опцію: " opt
case "$opt" in
    0) run_script "module/bc.sh" ;;
    1) run_script "module/update.sh" ;;
    2) run_script "module/proot_python_tur-repo.sh" ;;
    3) run_script "module/thc-hydra_make_mandoc.sh" ;;
    4) run_script "module/libjpeg-turbo_libpng_zlib.sh" ;;
    5) run_script "module/openssl_rust.sh" ;;
    6) run_script "module/ffmpeg.sh" ;;
    7) run_script "module/yt-dlp.sh" ;;
    8) echo -e "\e[1;33m👋 До зустрічі!\e[0m" && exit ;;
    9) run_script "module/findutils.sh" ;;
    10) run_script "video/check-tools.sh" ;;
    11) run_script "module/curl_jq.sh" ;;
    12) run_script "video/robby.sh" ;;
    13) run_script "tikttok/tik_tok.sh" ;;
    14) run_script "module/jerry.sh" ;;
    15) run_script "uzvar/jerry.sh" ;;
    16) run_script "module/x11-repo.sh" ;;
    17) run_script "start/start_xfce.sh" ;;
    18) run_script "start/mine.sh" ;;
    19) run_script "module/maigret.sh" ;;
    20) run_script "module/mr_holmes.sh" ;;
    21) run_script "robby/uzvarua.sh" ;;
    22) run_script "module/asciinema.sh" ;;
    23) run_script "uuid/uuid_menu.sh" ;;
    *) echo -e "\e[1;31m❌ Невірна опція. Спробуйте ще раз.\e[0m" ;;
esac
