```
├── install.sh
├── module/
│   ├── ffmpeg.sh
│   ├── libjpeg-turbo_libpng_zlib.sh
│   ├── openssl_rust.sh
│   ├── proot_python_tur-repo.sh
│   ├── thc-hydra_make_mandoc.sh
│   ├── update.sh
│   └── yt-dlp.sh

```
***

# Встановлення 
1. ```bash
   termux-change-repo
   ```
2. ```bash
   pkg update -y && pkg upgrade -y
   pkg install git -y
   ```
3. ```bash
   git clone https://github.com/uzvarUA/termux-uzvarua
   ```
4. ```bash
   cd $HOME/termux-uzvarua && chmod +x install.sh && ./install.sh
   ```
