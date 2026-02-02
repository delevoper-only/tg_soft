#!/bin/bash
# Авто-установщик TG Tools от delevoper-only

echo -e "\033[0;36m[+] Начинаю установку софта...\033[0m"

# 1. Создаем структуру папок
mkdir -p ~/tg_tool/pyarmor_runtime_000000
cd ~/tg_tool

# 2. Скачиваем все компоненты (твои проверенные ссылки)
echo -e "\033[0;33m[1/3] Загрузка файлов кода и защиты...\033[0m"
wget -q -O main.py "https://raw.githubusercontent.com/delevoper-only/tg_soft/refs/heads/main/main.py"
wget -q -O pyarmor_runtime_000000/__init__.py "https://raw.githubusercontent.com/delevoper-only/tg_soft/refs/heads/main/__init__.py"
wget -q -O pyarmor_runtime_000000/pyarmor_runtime.so "https://github.com/delevoper-only/tg_soft/raw/refs/heads/main/pyarmor_runtime.so"

# 3. Установка окружения (Python и библиотеки)
echo -e "\033[0;33m[2/3] Установка системных пакетов и Python...\033[0m"
pkg update -y && pkg upgrade -y
pkg install python -y
pip install telethon requests

# 4. Настройка конфига (ввод данных юзером)
echo -e "\033[0;36m[3/3] Финальная настройка API...\033[0m"
echo "Введите данные с сайта my.telegram.org:"
read -p "API ID: " aid
read -p "API HASH: " ahash

cat <<EOF > config.ini
[Telegram]
api_id = $aid
api_hash = $ahash
[Settings]
delay_min = 30
delay_max = 60
EOF

echo -e "\033[0;32m[!] Установка завершена успешно!\033[0m"
echo -e "\033[1;37mДля запуска софта введи:\033[0m \033[1;33mpython main.py\033[0m"