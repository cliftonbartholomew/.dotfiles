# Linux Development Setup

First add a with [[useradd]]

Generate an ssh public/private key:
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Get the public key and paste in github:
```bash
cat ~/.ssh/id_rsa.pub
```

install .dotfiles
```bash
git clone git@github.com:cliftonbartholomew/.dotfiles.git 
```

run setup
```bash
yes | .dotfiles/setup.sh
```

source .bashrc
```bash
source .bashrc
```
register copilot
```bash
:Copilot auth
```
