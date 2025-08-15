#!/bin/bash
set -euo pipefail

SSHD_CONFIG="/etc/ssh/sshd_config"
BACKUP="${SSHD_CONFIG}.$(date +%Y%m%d-%H%M%S).bak"

# Optional: override via env
PORT="${PORT:-}"                 # e.g. PORT=2222
ALLOW_USERS="${ALLOW_USERS:-}"   # e.g. ALLOW_USERS="clifton"

echo "[*] Backing up $SSHD_CONFIG -> $BACKUP"
sudo cp "$SSHD_CONFIG" "$BACKUP"

# helper: ensure "Key Value" exists (replace if present, else append)
ensure_opt () {
  local key="$1"; shift
  local val="$*"
  if sudo grep -Eq "^[#[:space:]]*${key}\b" "$SSHD_CONFIG"; then
    sudo sed -Ei "s|^[#[:space:]]*${key}\b.*|${key} ${val}|" "$SSHD_CONFIG"
  else
    echo "${key} ${val}" | sudo tee -a "$SSHD_CONFIG" >/dev/null
  fi
}

echo "[*] Applying hardening options..."

# Auth & account
ensure_opt PermitRootLogin                no
ensure_opt PasswordAuthentication         no
ensure_opt ChallengeResponseAuthentication no
ensure_opt PubkeyAuthentication           yes

# Protocol & limits
ensure_opt Protocol                       2
ensure_opt MaxAuthTries                   3
ensure_opt MaxSessions                    2
ensure_opt LoginGraceTime                 20

# Misc security
ensure_opt X11Forwarding                  no
ensure_opt LogLevel                       VERBOSE

# Optional: custom port
if [[ -n "$PORT" ]]; then
  ensure_opt Port "$PORT"
  echo "    - Port set to $PORT"
fi

# Optional: restrict users
if [[ -n "$ALLOW_USERS" ]]; then
  ensure_opt AllowUsers "$ALLOW_USERS"
  echo "    - AllowUsers set to: $ALLOW_USERS"
fi

echo "[*] Testing SSH config syntax..."
sudo sshd -t

echo "[*] Restarting SSH..."
# Some systems use 'ssh', others 'sshd'
if systemctl list-unit-files | grep -q '^ssh\.service'; then
  sudo systemctl restart ssh
else
  sudo systemctl restart sshd
fi

echo
echo "[✔] SSH hardening complete."
echo "    Backup saved at: $BACKUP"
echo "    Keep your current session open and test from a new terminal:"
echo "      ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no user@host"

