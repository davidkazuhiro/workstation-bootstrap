#!/bin/bash

# Provided by default
# Outlook

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Generate SSH Keys
ssh-keygen -t ed25519

# Add Key to GitHub
read -n 1 -s -r -p "Add SSH public key to GitHub, then press any key to continue"

## Add config for login servers

# GitHub
## Add public key to GitHub

brew install jq

## Clone all repos
clone_repos() {
  mkdir -p "$HOME/git/github/$1"
  while read repo; do
    git clone $(echo ${repo} | cut -d ' ' -f 2) $HOME/git/github/${2}/$(echo ${repo} | cut -d ' ' -f 1)
  done < <(curl -s "https://api.github.com/${1}s/${2}/repos?per_page=200" | jq -r '.[] | .name + " " + .ssh_url')
}

clone_repos user davidkazuhiro
clone_repos org rakutentech

# Configure Terminal

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
  mkdir -p "$HOME/git/bitbucket/$1"
  while read repo; do
    git clone $(echo ${repo} | cut -d ' ' -f 2) $HOME/git/ghe/${1}/$(echo ${repo} | cut -d ' ' -f 1)
  done < <(curl -s "https://git.rakuten-it.com/rest/api/1.0/${1}s/${2}/repos?per_page=200" | jq -r '.[].values | .slug + " " + \(.links.clone[] | select(.name == "ssh" | .href)')
}

clone_repos project DSH
clone_repos user david.somers-harris

# Enable Japanese Input

# Wivia
# ChefDK
