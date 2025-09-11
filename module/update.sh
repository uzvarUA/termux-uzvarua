#!/data/data/com.termux/files/usr/bin/bash
# 📦 Termux Repo & Package Updater
# Автор: Роббі

set -e

# 🎨 Кольори
GREEN='\e[32m'
RED='\e[31m'
YELLOW='\e[33m'
RESET='\e[0m'

echo -e "${YELLOW}🔧 Зміна репозиторіїв...${RESET}"
termux-change-repo

echo -e "${YELLOW}📡 Оновлення списку пакетів...${RESET}"
pkg update -y

echo -e "${YELLOW}⬆️ Оновлення встановлених пакетів...${RESET}"
pkg upgrade -y

echo -e "${GREEN}✅ Успішно завершено!${RESET}"
