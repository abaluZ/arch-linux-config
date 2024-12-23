#!/bin/bash

# Directorio donde están las imágenes
IMAGE_DIR="$HOME/Pictures/Wallpapers"

# Selecciona una imagen al azar
RANDOM_IMAGE=$(find "$IMAGE_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Cambia el fondo con swww
if [[ -n "$RANDOM_IMAGE" ]]; then
    swww img "$RANDOM_IMAGE"
else
    echo "No se encontraron imágenes en $IMAGE_DIR"
fi

