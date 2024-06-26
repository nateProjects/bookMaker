#!/bin/bash
# v0.5.0

# Function to install on MacOS
install_macos() {
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first: https://brew.sh/"
    exit 1
  else
    brew install pandoc typst gnu-sed grep
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
OS=$(uname -s)

case "$OS" in
  Darwin)
    echo "Detected MacOS - Installing Pandoc and Typst"
    install_macos
    ;;
  Linux)
    if [ -f /etc/debian_version ]; then
      echo "Detected Debian-based Linux - Installing Pandoc and Typst"
      install_debian
    elif [ -f /etc/redhat-release ]; then
      echo "Detected Redhat-based Linux - Installing Pandoc and Typst"
      install_redhat
    else
      echo "Unsupported Linux distribution. This script supports Debian-based and Redhat-based distributions."
      exit 1
    fi
    ;;
  *)
    echo "Unsupported OS. This script supports MacOS and Linux distributions."
    exit 1
    ;;
esac

chmod +x bookMaker md2typst

