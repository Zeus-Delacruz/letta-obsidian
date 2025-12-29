#!/bin/bash

# Letta Plugin - One-Time Vault Setup
# This script links your plugin repo to your Obsidian vault

echo "🔗 Letta Plugin - Vault Setup"
echo "======================================"
echo ""

# Check if vault path is already configured
if [ -f .vaultpath ] && grep -q "VAULT_PATH=." .vaultpath; then
    source .vaultpath
    echo "📂 Found existing vault configuration: $VAULT_PATH"
    echo ""
    read -p "Do you want to use this vault? (y/n): " use_existing
    if [ "$use_existing" != "y" ]; then
        VAULT_PATH=""
    fi
fi

# If no vault path, ask for it
if [ -z "$VAULT_PATH" ]; then
    echo "📍 Find your Obsidian vault location:"
    echo ""
    echo "Common locations:"
    echo "  - ~/Documents/ObsidianVault"
    echo "  - ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/YourVaultName"
    echo "  - ~/Obsidian/YourVaultName"
    echo ""
    read -p "Enter your vault path: " VAULT_PATH

    # Save to config file
    echo "VAULT_PATH=$VAULT_PATH" > .vaultpath
    echo "✅ Saved vault location to .vaultpath"
fi

# Expand ~ to full path if needed
VAULT_PATH="${VAULT_PATH/#\~/$HOME}"

# Verify vault exists
if [ ! -d "$VAULT_PATH" ]; then
    echo "❌ Error: Vault not found at $VAULT_PATH"
    echo "Please check the path and try again."
    exit 1
fi

# Verify .obsidian folder exists
if [ ! -d "$VAULT_PATH/.obsidian" ]; then
    echo "❌ Error: $VAULT_PATH doesn't look like an Obsidian vault (no .obsidian folder)"
    exit 1
fi

echo ""
echo "✅ Vault found: $VAULT_PATH"
echo ""

# Create plugins folder if it doesn't exist
PLUGINS_DIR="$VAULT_PATH/.obsidian/plugins"
if [ ! -d "$PLUGINS_DIR" ]; then
    echo "📁 Creating plugins directory..."
    mkdir -p "$PLUGINS_DIR"
fi

# Get the current directory (repo location)
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN_DIR="$PLUGINS_DIR/letta"

echo "🔗 Setting up symlink..."
echo "  From: $REPO_DIR"
echo "  To: $PLUGIN_DIR"
echo ""

# Remove existing plugin folder if it exists
if [ -e "$PLUGIN_DIR" ]; then
    echo "⚠️  Existing Letta plugin found"
    read -p "Replace it with symlink to dev repo? (y/n): " replace
    if [ "$replace" = "y" ]; then
        rm -rf "$PLUGIN_DIR"
        echo "✅ Removed old plugin"
    else
        echo "❌ Cancelled. Keeping existing plugin."
        exit 0
    fi
fi

# Create symlink
ln -s "$REPO_DIR" "$PLUGIN_DIR"

if [ $? -eq 0 ]; then
    echo "✅ Symlink created successfully!"
    echo ""
    echo "🎉 Setup complete!"
    echo ""
    echo "📝 Next steps:"
    echo "  1. Run: ./auto-dev.sh"
    echo "  2. Reload Obsidian (Cmd+R)"
    echo "  3. Enable the Letta plugin in settings"
    echo ""
    echo "💡 From now on:"
    echo "  - Edit code anywhere"
    echo "  - auto-dev.sh builds automatically"
    echo "  - Just reload Obsidian to see changes!"
else
    echo "❌ Error: Failed to create symlink"
    exit 1
fi
