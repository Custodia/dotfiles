# .zshrc, only sourced in interactive shells

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GPG_TTY=$(tty)

# Add custom shell scripts to path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/dotfiles/bin"
export PATH="$HOME/.mix/escripts:$PATH"
export PATH="$PATH:$HOME/go/bin"

# Quick way to create tmux sessions per folder
alias tms="tmux_sessionizer"

# Make ripgrep scan hidden files but not .git files
alias rg='rg --hidden --glob="!.git"'

# Colorize ls output by default
alias ls='ls -G'
alias lz='eza --icons=always'

# Initialise completion system
autoload -Uz compinit && compinit

# Git worktree wrapper (gwt) — function + completions loaded from script
eval "$(git_worktree_manager init)"

# Load tmuxifier
export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts/"
eval "$(tmuxifier init -)"

# Set zsh history options
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Enable powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable zsh auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable zsh syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start zoxide (better cd)
eval "$(zoxide init zsh)"
alias zd='z'
