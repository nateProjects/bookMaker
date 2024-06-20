#!/bin/bash

# Function to install on MacOS
install_macos() {
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first: https://brew.sh/"
    exit 1
  else
    brew install pandoc typst
  fi
}

# Function to install on Debian-based Linux
install_debian() {
  sudo apt update
  sudo apt install -y pandoc typst
}

# Function to install on Redhat-based Linux
install_redhat() {
  sudo yum install -y pandoc typst
}

# Detect the OS and run the appropriate function
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Detected MacOS - Installing Pandoc and Typst"
  install_macos
elif [[ -f /etc/debian_version ]]; then
  echo "Detected Debian-based Linux - Installing Pandoc and Typst"
  install_debian
elif [[ -f /etc/redhat-release ]]; then
  echo "Detected Redhat-based Linux - Installing Pandoc and Typst"
  install_redhat
else
  echo "Unsupported OS. This script supports MacOS, Debian-based, and Redhat-based Linux distributions."
  exit 1
fi
