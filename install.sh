#!/bin/bash
PROJECT_DIR="$HOME/tg_tool"
cd $HOME
rm -rf "$PROJECT_DIR"
mkdir -p "$PROJECT_DIR/pyarmor_runtime_000000/android_aarch64"

# Скачиваем файлы
wget -q -O "$PROJECT_DIR/main.py" "https://raw.githubusercontent.com/delevoper-only/tg_soft/main/main.py"
wget -q -O "$PROJECT_DIR/pyarmor_runtime_000000/__init__.py" "https://raw.githubusercontent.com/delevoper-only/tg_soft/main/pyarmor_runtime_000000/__init__.py"

# Качаем .so и делаем дубликат с правильным именем для импорта
URL_SO="https://raw.githubusercontent.com/delevoper-only/tg_soft/main/pyarmor_runtime_000000/android_aarch64/pyarmor_runtime.so"
wget -q -O "$PROJECT_DIR/pyarmor_runtime_000000/android_aarch64/pyarmor_runtime.so" "$URL_SO"
cp "$PROJECT_DIR/pyarmor_runtime_000000/android_aarch64/pyarmor_runtime.so" "$PROJECT_DIR/pyarmor_runtime_000000/android_aarch64/__pyarmor__.so"

cd "$PROJECT_DIR"
python main.py

echo -e "\033[0;32m[!] Готово! Для запуска введи:\033[0m"
echo -e "\033[1;33mcd ~/tg_tool && python main.py\033[0m"
