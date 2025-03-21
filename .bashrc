# tools
alias nvim='/bin/nvim-linux-x86_64/bin/nvim'
alias python='python3'
alias pip='pip3'

# copilot
alias cs='gh copilot suggest'
alias ce='gh copilot explain'

# movement files and folders
alias ll='ls -alF'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'

# ssh
alias sshs='~/.dotfiles/ssh_staging.sh'
alias sshp='~/.dotfiles/ssh_production.sh'

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'


# developed dev commands
function run_developed_demo() {
    source ~/.venv/developed-demo/bin/activate
    cd ~/developed-demo/src
    sudo service postgresql start
    python manage.py runserver --settings=developed.settings.dev
}

alias dr='run_developed_demo' # developed run
alias de='cd ~/developed-demo/ && source ~/.venv/developed-demo/bin/activate && nvim' # developed edit
