#!/bin/bash
# $1: email
# $2: file name

ssh-keygen -t ed25519 -C "$1" -f "$HOME/.ssh/$2"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Start the ssh-agent in the background.
  eval "$(ssh-agent -s)"
  # Create a config file if it doesn't exist.
  if [ ! -e "$HOME/.ssh/config" ]; then touch "$HOME/.ssh/config"; fi
  # Automatically load keys into the ssh-agent and store passphrases in your keychain.
  echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/$2" | tee "$HOME/.ssh/config"
  # Add your SSH private key to the ssh-agent and store your passphrase in the keychain.
  ssh-add --apple-use-keychain "$HOME/.ssh/$2"
  # Copy the public key to the clipboard.
  pbcopy < "$HOME/.ssh/$2.pub"
else
  xclip -sel clip < "$HOME/.ssh/$2.pub"
fi

echo "SSH key copied to clipboard."