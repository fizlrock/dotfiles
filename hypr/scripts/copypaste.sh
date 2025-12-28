#!/bin/bash

# Список классов окон, которые мы считаем терминалами
# Добавьте сюда свой терминал (kitty, foot, Alacritty, и т.д.)
TERM_CLASSES="kitty|foot|Alacritty|gnome-terminal|konsole"

# Получаем класс активного окна через hyprctl
ACTIVE_CLASS=$(hyprctl activewindow -j | jq -r '.class')

notify-send "making $1"
case "$1" in
    copy)
        # if [[ "$ACTIVE_CLASS" =~ $TERM_CLASSES ]]; then
        #     wtype -M Super c -m Super
        # else
            wtype -M ctrl c -m ctrl
        # fi
        ;;
    paste)
        if [[ "$ACTIVE_CLASS" =~ $TERM_CLASSES ]]; then
            wtype -M Super v -m Super
        else
            notify-send "using normal preset"
            # Для остальных: Ctrl + V
            wtype -M ctrl v -m ctrl
        fi
        ;;
esac
