#!/bin/bash

echo "=> Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update >/dev/null

echo "=> Installing RCM..."
brew tap thoughtbot/formulae
brew install rcm

echo "=> Bootstrapping RCM..."
# Apply without hooks
env RCRC="./tag-osx/rcrc" rcup -f -K -v -t osx

echo "=> Applying RCM configuration..."
rcup -f -v

echo "=> Finished installing dotfiles:"
lsrc

echo ""
echo "=> NOTE: Please set HOSTNAME in ~/.rcrc"
