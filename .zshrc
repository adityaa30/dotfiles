# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

# Docker 🐳
# alias docker="sudo docker"
# alias docker-compose="sudo docker-compose"

# Alias Shortcuts 🎬
alias k="kubectl"
alias d="docker"
alias g="git"
alias dc="docker-compose"

# exa 
# https://opensource.com/article/21/3/replace-ls-exa
alias ls="exa"

# Remove `...` such that no conflics while doing `bazel test ...`
unalias '...'

# JDK
unset JAVA_HOME
export JAVA8_HOME="$(/usr/libexec/java_home -v1.8)"
export JAVA11_HOME="$(/usr/libexec/java_home -v11)"
alias jdk_11='export JAVA_HOME="$JAVA11_HOME" && export PATH="$JAVA_HOME/bin:$PATH"'
alias jdk_8='export JAVA_HOME="$JAVA8_HOME" && export PATH="$JAVA_HOME/bin:$PATH"'
jdk_8 # Use jdk 11 as the default jdk

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export CUSTOM_SCRIPTS_DIR="$HOME/Documents/Scripts"
export PATH="$CUSTOM_SCRIPTS_DIR:$PATH"

export DEPOT_TOOLS="$HOME/Documents/Tools/depot_tools"
export PATH="$DEPOT_TOOLS:$PATH"

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export PATH="$HOME/bin:$PATH"

# Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# export DEPOT_TOOLS_DIR="$HOME/Documents/Projects/Dev/depot_tools"
# export PATH="$DEPOT_TOOLS_DIR:$PATH"

source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR=$(which vim)

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# direnv
echo -e "`date +"%Y-%m-%d %H:%M:%S"` direnv hooking zsh"
eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Extra
export HADOOP_HOME="$(brew --prefix hadoop)/libexec"
export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
export SPARK_HOME="$(brew --prefix apache-spark)/libexec"
export SPARK_CONF_DIR="$SPARK_HOME/conf"

# export APACHE_SPARK_HOME="$HOME/tools/spark-2.4.3-bin-hadoop2.6"
# export PATH="$APACHE_SPARK_HOME/bin:$PATH"

export ACTIVATOR_HOME="$HOME/tools/activator-dist-1.3.12"
export PATH=$ACTIVATOR_HOME/bin:$PATH

export PYTHON_BIN="$HOME/Library/Python/3.9"
export PATH=$PYTHON_BIN/bin:$PATH

