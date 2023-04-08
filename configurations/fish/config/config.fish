if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Import local configs
if test -d $HOME/.config/fish/local -a (ls -1 $HOME/.config/fish/local | count) -gt 0
  source $HOME/.config/fish/local/*
end

if test (which brew | count) -gt 0
  source (brew --prefix asdf)/libexec/asdf.fish
  source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
end
