#!/bin/bash

# Not in Brew
# LINE
# ChefDK
# Outlook
# Wivia

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Install laspass-cli
brew install lastpass-cli

# Install Synergy
brew cask install synergy

# Secret Management
brew cask install gpg-suite

# Install Browsers
brew cask install google-chrome
brew cask install firefox

# Chat
brew cask install hipchat
brew cask install slack
brew cask install microsoft-teams
brew cask install gitter

# git
brew install git

# Virtualization Tools
brew cask install vmware-fusion
brew cask install virtualbox
brew cask install vagrant
brew install terraform
brew cask install docker
brew cask install hab

# Network Tools
brew cask install wireshark


# Editors
brew cask install visual-studio-code

# Configure Terminal

# SSH
## Generate Keys
## Add config for login servers

# GitHub
## Add public key to GitHub

## Clone all repos
clone_repos() {
  mkdir -p "$HOME/git/github/$1"
  while read repo; do
    git clone $(echo ${repo} | cut -d ' ' -f 2) $HOME/git/github/${1}/$(echo ${repo} | cut -d ' ' -f 1)
  done < <(curl -s "https://api.github.com/${1}s/${2}/repos?per_page=200" | jq -r '.[] | .name + " " + .ssh_url')
}

clone_repos user davidkazuhiro
clone_repos org rakutentech

# GHE
## Add public key to GitHub

## Clone all repos
mkdir -p ~/git/ghe

clone_repos() {
  mkdir -p "$HOME/git/ghe/$1"
  while read repo; do
    git clone $(echo ${repo} | cut -d ' ' -f 2) $HOME/git/ghe/${1}/$(echo ${repo} | cut -d ' ' -f 1)
  done < <(curl -s "https://ghe.rakuten-it.com/api/v3/${1}s/${2}/repos?per_page=200" | jq -r '.[] | .name + " " + .ssh_url')
}

clone_repos user david-somers-harris

# BitBucket
## Do public keys work?

## NOT TESTED
clone_repos() {
  mkdir -p "$HOME/git/ghe/$1"
  while read repo; do
    git clone $(echo ${repo} | cut -d ' ' -f 2) $HOME/git/ghe/${1}/$(echo ${repo} | cut -d ' ' -f 1)
  done < <(curl -s "https://git.rakuten-it.com/rest/api/1.0/${1}s/${2}/repos?per_page=200" | jq -r '.[].values | .slug + " " + \(.links.clone[] | select(.name == "ssh" | .href)')
}

clone_repos project DSH
clone_repos user david.somers-harris

# Enable Japanese Input
