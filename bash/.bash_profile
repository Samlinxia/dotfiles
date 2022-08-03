if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Add company creds eg. aws, gcp, okta, git, etc
source ~/.bash_creds.sh

# User specific environment and startup programs
unset USERNAME

# Lets you cd to these directories from any directory
# by using the last node only (e.g. 'cd fbmake')
export CDPATH='.:~:~/www:~/fbmake:~/bin:~/logs'

BASE_DIR="/home/$USER"
export BASE_DIR

#Restrict bash history to unique commands, no duplicates
export HISTCONTROL=erasedups

export JAVA_HOME=$(/usr/libexec/java_home)
# Optional, not useful. Only $PATH is needed
#export M2_HOME=/Users/samlin/apache-maven-3.6.1

export GOPATH=$HOME/go

# Node.js env
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export CONSUL_RPC_ADDR='172.17.0.1:8400'
export CONSUL_HTTP_ADDR='172.17.0.1:8500'

# Editor use vim
VIM_PATH=/usr/bin
alias vi=${VIM_PATH}/vi
alias vim=${VIM_PATH}/vim
alias vimdiff=${VIM_PATH}/vimdiff
alias view=${VIM_PATH}/view
#alias mvim=/usr/local/Cellar/macvim/8.2-165_1/bin/mvim

export PATH=$PATH:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin:/usr/local/opt/ruby/bin:/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:/Applications/Docker.app:/Applications/Postgres.app/Contents/Versions/latest/bin:/Users/samlin/ops/.tools:/usr/local/go/bin/:/usr/local/opt/openssl@1.1/bin:/usr/local/opt/kubectl/bin:/usr/local/opt/libpq/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

# bash use vim mode key binding
set -o vi
export EDITOR=vim
export VISUAL=vim


# general
alias py="python3"
alias pip="pip3"
alias sterm='xterm -r -geometry 140x60 &'
alias smacs='cd $BASE_DIR/www; xemacs -geometry 140x72 &'
alias ld1='find . -maxdepth 1 -type d -print | sort' # keying *<Tab>< Tab> also works
alias l='less'

# easy way to customize config file and apply edit 
alias eb='vi ~/.bash_profile; source ~/.bash_profile' 
alias et='vi ~/.tmux.conf; tmux source-file ~/.tmux.conf'

# playground
export LOG_NAME="error_log_$USER"
alias log='tail -f ~/logs/$LOG_NAME | pretty'
alias restart='sudo $BASE_DIR/www/scripts/pusher/pusher_agent restart'
alias clean='sudo cp /dev/null $BASE_DIR/logs/$LOG_NAME'

# customized egrep (add string at the end, e.g. egphp "\WSomething"
alias egcpp='find . -name "*.cpp" -o -name "*.h" | xargs egrep -n --color'
alias egphp='find . -name "*.php" -o -name "*.phpt" | xargs egrep -n --color'
alias egjs='find . -name "*.js" | xargs egrep -n --color'
alias fw='find . -name "*" | xargs egrep -n --color'

# hg mercurial

# git
alias g='git'

# SVN
#SVN_EDITOR=vim
#export SVN_EDITOR
#alias update='cd $BASE_DIR/www; scripts/bin/svnw up'
#alias svns='svn status | egrep -v "^\?"'

# create TAGS
#   etags is used for emacs/xemacs, replace etags with ctags and add a -L option for vim
alias tagall='rm TAGS; find . -name "*.php" -o -name "*.phpt" -o -name "*.c" -o -name "*.cpp" -o -name "*.c++"  -o -name "*.h" -o -name "*.hpp" -o -name "*.py" -o -name "*.pl" -o -name "*.pm" -o -name "*.java" -o -name "*.thrift" | ctags -L -'
alias tagcpp='rm TAGS; find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" | ctags -L -'

# create cscope index
alias csgen='find . -type f -name "*.php" -o -name "*.phpt" -o -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.c++" -o -name "*.py" -o -name "*.pl" -o -name "*.pm" -o -name "*.java" -o -name "*.thrift" > cscope.files; rm cscope.in.out cscope.out cscope.po.out ; cscope -bq'

# curl
alias curlGetVault='curl -X GET -H "X-Vault-Token: ${VAULT_TOKEN}" $VAULT_ADDR$1'

# docker
export DOCKER_HOST="unix:///Users/samlin/.colima-amd/docker.sock"

alias tf='terraform'

# k8s
alias k='kubectl'
source <(kubectl completion zsh)
complete -F __start_kubectl k

# gcloud
alias gc='gcloud'
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

HISTSIZE=130000 HISTFILESIZE=-1
#Cycle through commands to a partial match
#bind '"\e[A"':history-search-backward
#bind '"\e[B"':history-search-forward
