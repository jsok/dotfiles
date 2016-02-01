#!/bin/bash

echo "=> Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "=> Installing RCM..."
brew tap thoughtbot/formulae
brew install rcm

echo "=> Bootstrapping OS X environment..."
# Install only OS X dotfiles and skip hooks
env RCRC=tag-osx/rcrc rcup -K -t osx

echo "=> Applying RCM configuration..."
rcup

echo "=> Finished installing dotfiles."
echo ""
echo "=> Please set HOSTNAME in ~/.rcrc"
