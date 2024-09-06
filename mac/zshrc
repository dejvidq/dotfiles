eval "$(oh-my-posh prompt init zsh --config $HOME/dotfiles/oh-my-posh/material.omp.json)"
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^[OA" history-beginning-search-backward
bindkey "^[OB" history-beginning-search-forward
setopt menucomplete

if [ -f $HOME/.zsh_aliases ]; then
        source $HOME/.zsh_aliases
fi

export EDITOR=nvim
export VISUAL=nvim
bindkey -e
export PATH="/Users/dawid/.local/bin:$PATH"

source $HOME/Projects/autoenv-sh/autoenv.sh
cd() {
	builtin cd "$@"
	smart_venv_activate
}
export PATH="/opt/homebrew/opt/util-linux/bin:$PATH"
export PATH="/opt/homebrew/opt/util-linux/sbin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new -A -s default
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
