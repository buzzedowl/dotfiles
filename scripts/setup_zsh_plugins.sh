#!/usr/bin/env bash
# Install zsh plugins for dotfiles
# Installs: zsh-autosuggestions, zsh-syntax-highlighting

set -e

echo "🔌 Installing zsh plugins..."

# Create custom plugins directory
mkdir -p "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins"

# Install zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo "📦 Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
else
    echo "✅ zsh-autosuggestions already installed"
fi

# Install zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo "📦 Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
else
    echo "✅ zsh-syntax-highlighting already installed"
fi

echo "🎉 All zsh plugins installed successfully!"
echo "💡 Run 'source ~/.zshrc' to activate the plugins"