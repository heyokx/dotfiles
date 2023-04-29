#!/usr/bin/env fish

set -l curr_path (status dirname)

git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.11.3
and mkdir -p $__fish_config_dir/installations
and ln -s $curr_path/resources/asdf.fish $__fish_config_dir/installations
and mkdir -p $__fish_config_dir/completions
and ln -s $HOME/.asdf/completions/asdf.fish $__fish_config_dir/completions
