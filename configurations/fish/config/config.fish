if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Import local configs
source $HOME/.config/fish/local/*

source (brew --prefix asdf)/libexec/asdf.fish
