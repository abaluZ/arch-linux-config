#!/bin/bash

echo "Instalando dependencias..."
sudo pacman -Syu --needed git base-devel

echo "Clonando configuraciones..."
git clone https://github.com/TU_USUARIO/arch-linux-config.git ~/arch-linux-config

echo "Copiando configuraciones..."
cp -r ~/arch-linux-config/.config/* ~/.config/

echo "Instalación completada."

