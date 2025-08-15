# Linux Development Setup

On client (dev machine), add shh key from vault:
```bash
mkdir .ssh
touch .ssh/id_rsa
touch .ssh/id_rsa.pub
```

Or make a new one:
```bash
ssh-keygen -t ed25519 -C "cliftonbartholomew@gmail.com"
```

Copy ssh key to server (password is prompted):
```bash
ssh-copy-id clifton@102.130.115.69 # change ip
```

edit ssh config on client (dev machine):
```bash
nvim ~/.ssh/config
```

add server to config for easy ssh:
```bash
Host production
    HostName 102.130.115.69
    User clifton
    Port 22
```

ssh into server:
```bash
ssh production
```

Add a new user with a home directory and sudo access:
```bash
useradd clifton --shell /bin/bash
mkdir /home/clifton/
chown clifton:clifton /home/clifton
usermod -aG sudo clifton
passwd clifton
```

Switch to that user:
```bash
su - clifton
```

Generate an ssh public/private key (this time for github and server):
```bash
ssh-keygen -t rsa -b 4096 -C "cliftonbartholomew@gmail.com"
```

Get the public key and paste in github:
```bash
cat ~/.ssh/id_rsa.pub
```

install git
```bash
sudo apt-get update
sudo apt install git
```

install .dotfiles
```bash
git clone git@github.com:cliftonbartholomew/.dotfiles.git
```

run setup files
```bash
.dotfiles/install/setup_prod.sh
.dotfiles/install/setup_dev.sh
```

source .bashrc
```bash
source .bashrc
```
register copilot
```bash
:Copilot auth
```

make sure win32yank is install in windows
```bash
winget install win32yank
```
