# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_BASE=$HOME/dotfiles

source $ZSH_BASE/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle thefuck
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle docker
antigen bundle docker-compose
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle esc/conda-zsh-completion
antigen bundle gh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle heroku

antigen theme romkatv/powerlevel10k

antigen apply

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
source ~/.shell/aliases.sh

# Functions
source ~/.shell/functions.sh

eval "$(thefuck --alias)"

# Env vars
source ~/.shell/env_vars.sh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/antony/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/antony/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/antony/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/antony/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/antony/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# Add 1password shell completion
eval "$(op completion zsh)"; compdef _op op


# Initialize zoxide
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# QPDF zsh completion
autoload -U +X bashcompinit && bashcompinit && complete -o bashdefault -o default -C qpdf qpd

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
