set -gx HOMEBASE_ROOT $HOME/Homebase
set -gx HOMEBASE_WORKSPACE $HOMEBASE_ROOT/worktrees
set -gx GHQ_ROOT $HOMEBASE_ROOT/git
set -gx ASDF_ROOT $HOME/.asdf
set -gx PYENV_ROOT $HOME/.pyenv
set -gx VM_NIXOS mb-vm-nixos

set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include

# Hydro Shell Prompt
set -gx hydro_multiline true
set -gx hydro_color_pwd magenta

# Path Related 
fish_add_path $HOME/.cargo/bin
fish_add_path $PYENV_ROOT/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/bin /usr/local/bin
fish_add_path $HOME/Library/Application
fish_add_path -m $HOME/.local/bin $HOMEBASE_ROOT/bin
