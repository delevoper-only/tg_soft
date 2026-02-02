#!/bin/bash
# Авто-установщик и апдейтер от delevoper-only

PROJECT_DIR="$HOME/tg_tool"

echo -e "\033[0;36m[+] Проверка папок проекта...\033[0m"

# Создаем структуру, если её нет
mkdir -p "$PROJECT_DIR/pyarmor_runtime_000000/android_aarch64"
cd "$PROJECT_DIR"

echo -e "\033[0;33m[*] Загрузка актуальных компонентов...\033[0m"

# Скачиваем файлы (используем флаг -O чтобы точно перезаписать старые)
wget -q -O main.py "https://raw.githubusercontent.com/delevoper-only/tg_soft/main/main.py"
wget -q -O pyarmor_runtime_000000/__init__.py "https://raw.githubusercontent.com/delevoper-only/tg_soft/main/pyarmor_runtime_000000/__init__.py"
wget -q -O pyarmor_runtime_000000/android_aarch64/pyarmor_runtime.so "https://raw.githubusercontent.com/delevoper-only/tg_soft/main/pyarmor_runtime_000000/android_aarch64/pyarmor_runtime.so"

# Проверка библиотек (Python и Telethon)
if ! command -v python &> /dev/null; then
    echo -e "\033[0;33m[*] Установка Python...\033[0m"
    pkg update -y && pkg install python -y
fi

echo -e "\033[0;33m[*] Проверка библиотек Python...\033[0m"
pip install --upgrade telethon requests &> /dev/null

# Настройка конфига (только если его нет)
if [ ! -f "config.ini" ]; then
    echo -e "\033[0;36m[?] Первая настройка. Введите данные с my.telegram.org:\033[0m"
    read -p "API ID: " aid
    read -p "API HASH: " ahash
    echo -e "[Telegram]\napi_id = $aid\napi_hash = $ahash\n[Settings]\ndelay_min = 30\ndelay_max = 60" > config.ini
fi

echo -e "\033[0;32m[!] Готово! Для запуска введи:\033[0m"
echo -e "\033[1;33mcd ~/tg_tool && python main.py\033[0m"
