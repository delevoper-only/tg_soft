#!/bin/bash
# Умный установщик TG Tools от delevoper-only

PROJECT_DIR="$HOME/tg_tool"

echo -e "\033[0;36m[+] Проверка окружения...\033[0m"

# 1. Проверяем, установлена ли папка. Если да — обновляем, если нет — создаем.
if [ -d "$PROJECT_DIR" ]; then
    echo -e "\033[0;33m[!] Софт уже установлен. Обновляю файлы...\033[0m"
    cd "$PROJECT_DIR"
else
    echo -e "\033[0;32m[+] Установка новой копии...\033[0m"
    mkdir -p "$PROJECT_DIR/pyarmor_runtime_000000/android_aarch64"
    cd "$PROJECT_DIR"
fi

# 2. Скачиваем/Обновляем файлы кода и защиты
echo -e "\033[0;33m[*] Загрузка актуальных версий...\033[0m"
wget -q -N -O main.py "https://raw.githubusercontent.com/delevoper-only/tg_soft/main/main.py"
wget -q -N -O pyarmor_runtime_000000/__init__.py "https://raw.githubusercontent.com/delevoper-only/tg_soft/main/pyarmor_runtime_000000/__init__.py"
wget -q -N -O pyarmor_runtime_000000/android_aarch64/pyarmor_runtime.so "https://github.com/delevoper-only/tg_soft/raw/main/pyarmor_runtime_000000/android_aarch64/pyarmor_runtime.so"

# 3. Проверка зависимостей (только если не установлены)
if ! command -v python &> /dev/null; then
    echo -e "\033[0;33m[*] Установка Python...\033[0m"
    pkg update -y && pkg install python -y
fi

# Проверка библиотек через pip
echo -e "\033[0;33m[*] Проверка библиотек...\033[0m"
pip install --upgrade telethon requests &> /dev/null

# 4. Проверка конфига
if [ ! -f "config.ini" ]; then
    echo -e "\033[0;36m[?] Конфиг не найден. Настройка API...\033[0m"
    read -p "API ID: " aid
    read -p "API HASH: " ahash
    echo -e "[Telegram]\napi_id = $aid\napi_hash = $ahash" > config.ini
else
    echo -e "\033[0;32m[+] Конфиг уже на месте, пропускаю настройку.\033[0m"
fi

echo -e "\033[0;32m[!] Готово! Запуск:\033[0m"
echo -e "\033[1;33mcd ~/tg_tool && python main.py\033[0m"
