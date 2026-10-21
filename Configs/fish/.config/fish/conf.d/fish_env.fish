set -gx HOMEBASE_WORKSPACE worktrees

set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include

# Hydro Shell Prompt
set -gx hydro_multiline true
set -gx hydro_color_pwd magenta

# Path Related 
fish_add_path $HOME/.cargo/bin
fish_add_path $PYENV_ROOT/bin
fish_add_path $HOME/.pi/agent/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/bin /usr/local/bin
fish_add_path /Applications/WezTerm.app/Contents/MacOS
fish_add_path $HOME/Library/Application
fish_add_path $HOME/.local/share/pnpm/bin
fish_add_path -m $HOME/.local/bin
