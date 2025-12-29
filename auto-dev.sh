#!/bin/bash

# Letta Plugin - Auto Development Script
# This script watches for file changes and automatically rebuilds the plugin

echo "🚀 Starting Letta Plugin Auto-Development Mode"
echo "================================================"
echo ""
echo "✨ What this does:"
echo "  - Watches for changes in your code"
echo "  - Automatically rebuilds when you save"
echo "  - Just reload Obsidian (Cmd+R) to see changes!"
echo ""
echo "🛑 To stop: Press Ctrl+C"
echo "================================================"
echo ""

# Run the development build watcher
npm run dev
