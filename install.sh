#!/bin/bash
# Финальный и стабильный установщик
PROJECT_DIR="$HOME/tg_tool"

echo -e "\033[0;36m[+] Подготовка окружения...\033[0m"

# Уходим в корень, чтобы не было ошибок с путями
cd $HOME

# Создаем структуру заново для чистоты
rm -rf "$PROJECT_DIR"
mkdir -p "$PROJECT_DIR/pyarmor_runtime_000000/android_aarch64"
cd "$PROJECT_DIR"

echo -e "\033[0;33m[*] Загрузка компонентов с GitHub...\033[0m"

# 1. Основной скрипт
wget -q -O main.py "https://raw.githubusercontent.com/delevoper-only/tg_soft/main/main.py"

# 2. Файлы рантайма (защиты)
wget -q -O pyarmor_runtime_000000/__init__.py "https://raw.githubusercontent.com/delevoper-only/tg_soft/main/pyarmor_runtime_000000/__init__.py"
wget -q -O pyarmor_runtime_000000/android_aarch64/pyarmor_runtime.so "https://raw.githubusercontent.com/delevoper-only/tg_soft/main/pyarmor_runtime_000000/android_aarch64/pyarmor_runtime.so"

# 3. Библиотеки
echo -e "\033[0;33m[*] Проверка зависимостей...\033[0m"
pip install --upgrade telethon requests &> /dev/null

# 4. Конфиг
if [ ! -f "config.ini" ]; then
    echo -e "[Telegram]\napi_id = 28655879\napi_hash = 3ea8adc73d99ba0018e7c42b6be359c9" > config.ini
fi

echo -e "\033[0;32m[!] Всё готово. Запускаем! \033[0m"
python main.py

echo -e "\033[0;32m[!] Готово! Для запуска введи:\033[0m"
echo -e "\033[1;33mcd ~/tg_tool && python main.py\033[0m"
