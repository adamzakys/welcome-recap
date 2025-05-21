#!/bin/bash

echo "┌──────────────────────────────────────────────┐"
echo "│         🌟 WELCOME RECAP — Adam Zaky         │"
echo "└──────────────────────────────────────────────┘"
echo ""

echo "🕐 Login: $(date)"
echo ""

# Tampilkan 5 aplikasi terakhir dari log_apps.txt
echo "📦 Aplikasi terakhir:"
if [ -f ~/.welcome_recap/log_apps.txt ]; then
    tail -n 5 ~/.welcome_recap/log_apps.txt | tac
else
    echo "  (belum ada data aplikasi)"
fi
echo ""

# Tampilkan 10 perintah terakhir zsh
echo "💻 Perintah terminal terakhir:"
if [ -f ~/.zsh_history ]; then
    tail -n 10 ~/.zsh_history
else
    echo "  (tidak ada history zsh ditemukan)"
fi
echo ""

# Tampilkan screenshot terbaru inline kalau terminal support
latest_screenshot=$(ls -t ~/.welcome_recap/screenshots/*.png 2>/dev/null | head -1)

if [ -n "$latest_screenshot" ]; then
    echo "📸 Screenshot terakhir: $latest_screenshot"
    echo ""

    # Tampilkan inline sesuai terminal
    if [ "$TERM" = "xterm-kitty" ]; then
        kitty +kitten icat "$latest_screenshot"
    elif command -v wezterm &>/dev/null && [[ "$TERM" == *"wezterm"* ]]; then
        wezterm imgcat "$latest_screenshot"
    else
        echo "  (terminal ini tidak mendukung inline image)"
        echo "  Jalankan: xdg-open \"$latest_screenshot\" untuk lihat screenshot"
    fi
else
    echo "📸 Screenshot terakhir: (tidak ada screenshot ditemukan)"
fi

