#!/bin/bash

# Colores para mensajes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para imprimir mensajes
print_message() {
    echo -e "${GREEN}[*] $1${NC}"
}

print_error() {
    echo -e "${RED}[!] $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}[!] $1${NC}"
}

# Verificar si estamos en Arch Linux
if ! grep -q "Arch Linux" /etc/os-release; then
    print_error "Este script está diseñado para Arch Linux"
    exit 1
fi

# Verificar si el usuario es root
if [ "$EUID" -eq 0 ]; then
    print_error "Por favor, no ejecutes este script como root"
    exit 1
fi

# Crear directorios necesarios
print_message "Creando directorios de configuración..."
mkdir -p ~/.config
mkdir -p ~/.local/share/fonts

# Instalar paquetes necesarios
print_message "Instalando paquetes necesarios..."
sudo pacman -S --needed --noconfirm \
    neovim \
    git \
    hyprland \
    zsh \
    kitty \
    waybar \
    neofetch \
    fastfetch \
    ranger \
    sww \
    pavucontrol \
    curl \
    base \
    base-devel

# Instalar Yay (AUR helper)
if ! command -v yay &> /dev/null; then
    print_message "Instalando Yay..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Copiar archivos de configuración
print_message "Copiando archivos de configuración..."

# Zsh
cp .zshrc ~/.zshrc

# Configuración de Hyprland
cp -r config/hypr ~/.config/

# Configuración de Kitty
cp -r config/kitty ~/.config/

# Configuración de Waybar
cp -r config/waybar ~/.config/

# Configuración de Neovim
cp -r config/nvim ~/.config/

# Copiar scripts
print_message "Copiando scripts..."
cp toggle-theme.sh ~/.local/bin/
cp wallpaper_random.sh ~/.local/bin/
chmod +x ~/.local/bin/toggle-theme.sh
chmod +x ~/.local/bin/wallpaper_random.sh

# Copiar wallpapers
print_message "Copiando wallpapers..."
mkdir -p ~/Pictures/Wallpapers
cp -r Wallpapers/* ~/Pictures/Wallpapers/

# Cambiar shell a zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    print_message "Cambiando shell a zsh..."
    chsh -s $(which zsh)
fi

print_message "¡Instalación completada!"
print_message "Por favor, reinicia tu sesión para aplicar todos los cambios."
print_message "Recuerda que necesitarás iniciar sesión con Hyprland como gestor de ventanas." 