# Linux Development Setup

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


Generate an ssh public/private key:
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
