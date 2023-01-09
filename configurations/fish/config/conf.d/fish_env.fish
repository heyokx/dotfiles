set -gx HOMEBASE_ROOT $HOME/Homebase
set -gx GHQ_ROOT $HOMEBASE_ROOT/git
set -gx ASDF_ROOT $HOME/.asdf
set -gx PYENV_ROOT $HOME/.pyenv

set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include

# Path Related 
fish_add_path $HOME/.cargo/bin
fish_add_path $PYENV_ROOT/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/bin /usr/local/bin
fish_add_path "/Users/cwdesroches/Library/Application Support/JetBrains/Toolbox/scripts"
fish_add_path -m $HOME/.local/bin $HOMEBASE_ROOT/bin
