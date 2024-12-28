#!/bin/bash

KITTY_CONF="$HOME/.config/kitty/kitty.conf"
DARK_FOREGROUND="#FFFFFF"
DARK_BACKGROUND="#000000"
LIGHT_FOREGROUND="#000000"
LIGHT_BACKGROUND="#FFFFFF"

if grep -q "background $LIGHT_BACKGROUND" "$KITTY_CONF"; then
    sed -i "s/foreground .*/foreground $DARK_FOREGROUND/" "$KITTY_CONF"
    sed -i "s/background .*/background $DARK_BACKGROUND/" "$KITTY_CONF"
else
    sed -i "s/foreground .*/foreground $LIGHT_FOREGROUND/" "$KITTY_CONF"
    sed -i "s/background .*/background $LIGHT_BACKGROUND/" "$KITTY_CONF"

fi

kitty @ set-colors --all "$KITTY_CONF"


