# .zshenv, sourced on all invocations of the shell

# Get common options between zsh, bash and even sh
if [ -f ~/.profile ]; then
    . ~/.profile
fi

# Rust/cargo
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# Set secret values
if [ -f ~/dotfiles/secrets.sh ]; then
    . ~/dotfiles/secrets.sh
fi
