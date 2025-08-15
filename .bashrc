# tools
alias nvim='/bin/nvim-linux-x86_64/bin/nvim'
alias python='python3'
alias pip='pip3'

# movement files and folders
alias ll='ls -alF'

# developed dev commands
function run_developed_demo() {
    source ~/.venv/developed-demo/bin/activate
    cd ~/developed-demo/src
    sudo service postgresql start
    python manage.py runserver --settings=developed.settings.dev
}

alias dr='run_developed_demo' # developed run
alias de='cd ~/developed-demo/ && source ~/.venv/developed-demo/bin/activate && nvim' # developed edit
