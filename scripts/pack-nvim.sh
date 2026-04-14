#!/bin/env bash

set -euo pipefail

OUTPUT_FILE_PATH=${OUTPUT_FILE_PATH:-'./packed-nvim.run'}

if [ -f "$OUTPUT_FILE_PATH" ]; then
    rm "$OUTPUT_FILE_PATH"
fi

TMP=$(mktemp -d)
TMP_NVIM_BIN_TARBALL_PATH="$TMP/nvim-bin.tar.gz"
TMP_NVIM_CONFIG_TARBALL_PATH="$TMP/nvim-config.tar.gz"
TMP_NVIM_DATA_TARBALL_PATH="$TMP/nvim-data.tar.gz"
TMP_PACKED_NVIM_TARBALL_PATH="$TMP/packed-nvim.tar"

NVIM_DOWNLOAD_URL=${NVIM_DOWNLOAD_URL:-'https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz'}
NVIM_CONFIG_DIR=${NVIM_CONFIG_DIR:-"$HOME/.config/nvim"}
NVIM_DATA_DIR=${NVIM_DATA_DIR:-"$HOME/.local/share/nvim"}

ARCHIVE_MARKER='__ARCHIVE_DATA__'

wget "$NVIM_DOWNLOAD_URL"              -O $TMP_NVIM_BIN_TARBALL_PATH             >> /dev/null 2>&1 &
tar -czf $TMP_NVIM_CONFIG_TARBALL_PATH -C $NVIM_CONFIG_DIR --exclude='.git' .    >> /dev/null 2>&1 &
tar -czf $TMP_NVIM_DATA_TARBALL_PATH   -C $NVIM_DATA_DIR                \
    --exclude='.git'                                                    \
    'site/queries/cpp'                                                  \
    'site/queries/rust'                                                 \
    'site/queries/python'                                               \
    'site/queries/toml'                                                 \
    'site/queries/json'                                                 \
    'site/queries/yaml'                                                 \
                                                                        \
    'site/parser/cpp.so'                                                \
    'site/parser/rust.so'                                               \
    'site/parser/python.so'                                             \
    'site/parser/toml.so'                                               \
    'site/parser/json.so'                                               \
    'site/parser/yaml.so'                                               \
                                                                        \
    'site/parser-info/cpp.lua'                                          \
    'site/parser-info/rust.lua'                                         \
    'site/parser-info/python.lua'                                       \
    'site/parser-info/toml.lua'                                         \
    'site/parser-info/json.lua'                                         \
    'site/parser-info/yaml.lua'                                         \
                                                                        \
    --exclude='site/parser/'                                            \
    --exclude='site/parser-info/'                                       \
    --exclude='site/queries/'                                           \
    --exclude='site/registry'                                           \
                                                                        \
    'site/pack/core/opt/blink.cmp/target/release/libblink_cmp_fuzzy.so' \
    --exclude='site/pack/core/opt/blink.cmp/target'                     \
    'site' >> /dev/null 2>&1 &
wait

tar -cf $TMP_PACKED_NVIM_TARBALL_PATH  -C $TMP 'nvim-bin.tar.gz' 'nvim-config.tar.gz' 'nvim-data.tar.gz' >> /dev/null 2>&1

HEADER=$(cat <<'EOF'
#!/bin/env bash

set -euo pipefail

INSTALL_PREFIX="/opt/nvim"
CONFIG_DIR="$HOME/.config/nvim"
DATA_DIR="$HOME/.local/share/nvim"
ARCHIVE_MARKER='__ARCHIVE_DATA__'

usage() {
    cat <<USAGE
Usage: $(basename "$0") [OPTIONS]

Self-extracting Neovim installer.

Options:
    --uninstall    Remove installed Neovim
    --help         Show this help message

Installation paths:
    Neovim:        /opt/nvim
    Config:        ~/.config/nvim
    Data:          ~/.local/share/nvim

USAGE
}

uninstall() {
    echo "Uninstalling Neovim..."
    rm -rf "$INSTALL_PREFIX"
    rm -f /usr/local/bin/nvim
    echo "Neovim uninstalled (config and data preserved)"
    exit 0
}

# Parse arguments
case "${1:-}" in
    --help|-h)
        usage
        exit 0
        ;;
    --uninstall)
        uninstall
        ;;
esac

# Check for root privileges (needed for /opt and /usr/local/bin)
if [ "$(id -u)" -ne 0 ]; then
    echo "Re-running with sudo for system installation..."
    exec sudo "$0" "$@"
fi

echo "Installing Neovim..."

# Extract archive from this script
TMP=$(mktemp -d)
SCRIPT_PATH=$(readlink -f "$0")
ARCHIVE_LINE=$(grep -n "^$ARCHIVE_MARKER$" "$SCRIPT_PATH" | cut -d: -f1)

if [ -z "$ARCHIVE_LINE" ]; then
    echo "Error: Archive marker not found" >&2
    exit 1
fi

tail -n +$((ARCHIVE_LINE + 1)) "$SCRIPT_PATH" | base64 -d > "$TMP/packed-nvim.tar"
tar -xf "$TMP/packed-nvim.tar" -C "$TMP"

# Install Neovim to /opt/nvim
mkdir -p "$INSTALL_PREFIX"
tar -xzf "$TMP/nvim-bin.tar.gz" -C "$INSTALL_PREFIX" --strip-components=1

# Install config to ~/.config/nvim
SUDO_USER_HOME=$(eval echo "~$SUDO_USER")
mkdir -p "$SUDO_USER_HOME/.config/nvim"
tar -xzf "$TMP/nvim-config.tar.gz" -C "$SUDO_USER_HOME/.config/nvim"
chown -R "$SUDO_USER:$SUDO_USER" "$SUDO_USER_HOME/.config/nvim"

# Install data to ~/.local/share/nvim
mkdir -p "$SUDO_USER_HOME/.local/share/nvim"
tar -xzf "$TMP/nvim-data.tar.gz" -C "$SUDO_USER_HOME/.local/share/nvim"
chown -R "$SUDO_USER:$SUDO_USER" "$SUDO_USER_HOME/.local/share/nvim"

# Create symlink for nvim command
ln -sf "$INSTALL_PREFIX/bin/nvim" /usr/local/bin/nvim

# Cleanup
rm -rf "$TMP"

echo "Neovim installed successfully!"
echo "  Binary:     $INSTALL_PREFIX/bin/nvim"
echo "  Command:    nvim (via /usr/local/bin/nvim)"
echo "  Config:     $SUDO_USER_HOME/.config/nvim"
echo "  Data:       $SUDO_USER_HOME/.local/share/nvim"

exit 0
### NOTE: THIS FILE IS GENERATED. DON'T EDIT IT.
EOF
)

{
    echo "$HEADER"
    echo "$ARCHIVE_MARKER"
    base64 "$TMP_PACKED_NVIM_TARBALL_PATH"
} > ${OUTPUT_FILE_PATH}

chmod +x $OUTPUT_FILE_PATH

rm -r $TMP
