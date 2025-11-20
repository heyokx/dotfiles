#!/usr/bin/env fish

set -l curr_path (realpath (status dirname))

source ../../_functions/helpers.fish

set -l tool fisher

is-installed $tool
and rm -f $__fish_config_dir/fish_plugins # removes default fish_plugins file created during installation
and ln -s $curr_path/resources/fish_plugins $__fish_config_dir
and fisher update
and echo "Post-install complete!"
or echo "Post-install failed!"