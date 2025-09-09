#!/data/data/com.termux/files/usr/bin/bash

clear
echo "UzvarUa"
echo "Виберіть модуля"
echo "0) Встановлення bc"
echo "1) Оновлення пакетів"
echo "2) Встановлення proot python tur-repo"
echo "3) Встановлення thc-hydra make mandoc"
echo "4) Встановлення libjpeg-turbo libpng zlib"
echo "5) Встановлення openssh rust"
echo "6) Встановлення ffmpeg"
echo "7) Встановлення yt-dlp"
echo "8) Вийти"
echo "9) Встановлення findutils та which"

read -p "Виберіть опцію: " opt
case "$opt" in
	0) bash module/bc.sh ;;
	1) bash module/update.sh ;;
	2) bash module/proot_python_tur-repo.sh ;;
	3) bash module/thc-hydra_make_mandoc.sh ;;
	4) bash module/libjpeg-turbo_libpng_zlib.sh ;;
	5) bash module/openssl_rust.sh ;;
	6) bash module/ffmpeg.sh ;;
	7) bash module/yt-dlp.sh ;;
	8) echo "Вийти" && exit ;;
 	9) bash module/findutils.sh ;;
	*) echo "Не правильно"
esac
