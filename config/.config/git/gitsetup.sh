#!/usr/bin/env bash

# Stop on error
set -e

echo "=== Git & SSH setup starting ==="

# --------- CONFIG (EDIT THESE) ----------
GIT_NAME="idli-dev"
GIT_EMAIL="241423031+idli-dev@users.noreply.github.com"
SSH_KEY_NAME="id_ed25519"
# ---------------------------------------

# --------- GIT CONFIG ----------
echo "Configuring git..."

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

git config --global init.defaultBranch main
git config --global core.editor "nvim"
git config --global pull.rebase false
git config --global fetch.prune true
git config --global rerere.enabled true
git config --global color.ui auto

echo "Git configured."

# --------- SSH SETUP ----------
echo "Setting up SSH..."

SSH_DIR="$HOME/.ssh"
SSH_KEY_PATH="$SSH_DIR/$SSH_KEY_NAME"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# Generate key if it doesn't exist
if [ ! -f "$SSH_KEY_PATH" ]; then
  ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f "$SSH_KEY_PATH"
else
  echo "SSH key already exists: $SSH_KEY_PATH"
fi

# Start ssh-agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add "$SSH_KEY_PATH"

# --------- SSH CONFIG ----------
SSH_CONFIG="$SSH_DIR/config"

if ! grep -q "Host github.com" "$SSH_CONFIG" 2>/dev/null; then
  cat <<EOF >> "$SSH_CONFIG"

Host github.com
  HostName github.com
  User git
  IdentityFile $SSH_KEY_PATH
  AddKeysToAgent yes
EOF
fi

chmod 600 "$SSH_CONFIG"

# --------- DONE ----------
echo ""
echo "=== Setup complete ==="
echo ""
echo "👉 Add this SSH key to GitHub / GitLab:"
echo ""
cat "$SSH_KEY_PATH.pub"
echo ""
echo "Test with:"
echo "  ssh -T git@github.com"
