#!/bin/bash

# Neofetch ASCII Art Switcher
# Usage: ./switch-art.sh [dragon|matrix|minimal|arch]

CONFIG_FILE="$HOME/.config/neofetch/config.conf"
ART_DIR="$HOME/.config/neofetch"

case "$1" in
    "dragon")
        echo "🐉 Switching to Dragon ASCII art..."
        sed -i 's|image_source=".*"|image_source="'$ART_DIR'/dragon.txt"|' "$CONFIG_FILE"
        ;;
    "matrix")
        echo "🔴 Switching to Matrix ASCII art..."
        sed -i 's|image_source=".*"|image_source="'$ART_DIR'/matrix.txt"|' "$CONFIG_FILE"
        ;;
    "minimal")
        echo "◆ Switching to Minimal Geometric ASCII art..."
        sed -i 's|image_source=".*"|image_source="'$ART_DIR'/minimal.txt"|' "$CONFIG_FILE"
        ;;
    "arch")
        echo "🏛️ Switching back to default Arch ASCII art..."
        sed -i 's|image_source=".*"|image_source="auto"|' "$CONFIG_FILE"
        ;;
    *)
        echo "🎨 Neofetch ASCII Art Switcher"
        echo "Usage: $0 [dragon|matrix|minimal|arch]"
        echo ""
        echo "Available options:"
        echo "  dragon   - Cool dragon with wings"
        echo "  matrix   - Cyberpunk matrix style"
        echo "  minimal  - Geometric diamond pattern"
        echo "  arch     - Default Arch Linux logo"
        echo ""
        echo "Current setting:"
        grep "image_source=" "$CONFIG_FILE" | sed 's/image_source="\(.*\)"/  → \1/'
        exit 1
        ;;
esac

echo "✅ Done! Run 'neofetch' to see the new ASCII art."
echo "💡 Tip: You can also run 'neofetch --ascii_colors=(1 2 3 4 5 6)' to change colors!"

