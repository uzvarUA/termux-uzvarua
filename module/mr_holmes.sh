#!/data/data/com.termux/files/usr/bin/bash

# 🎩 Mr.Holmes Installer for Termux
# Автор: Роббі & Copilot

REPO_URL="https://github.com/Lucksi/Mr.Holmes"
REPO_DIR="Mr.Holmes"
INSTALL_SCRIPT="install_Termux.sh"

# 🌈 Кольори
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🔍 Клоную репозиторій Mr.Holmes...${NC}"
git clone "$REPO_URL" || {
    echo -e "${RED}❌ Помилка: не вдалося клонувати репозиторій.${NC}"
    exit 1
}

cd "$REPO_DIR" || {
    echo -e "${RED}❌ Помилка: не вдалося перейти до каталогу $REPO_DIR.${NC}"
    exit 1
}

if [[ -f "$INSTALL_SCRIPT" ]]; then
    chmod +x "$INSTALL_SCRIPT"
    echo -e "${YELLOW}🚀 Запускаю $INSTALL_SCRIPT...${NC}"
    ./"$INSTALL_SCRIPT"
else
    echo -e "${RED}❌ Скрипт $INSTALL_SCRIPT не знайдено.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Встановлення завершено!${NC}"
