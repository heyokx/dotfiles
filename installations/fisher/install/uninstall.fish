#!/usr/bin/env fish

set -l curr_path (realpath (status dirname))

source ../../_functions/helpers.fish

set -l tool fisher

echo "Uninstalling $tool.."

is-installed $tool
and cp $__fish_config_dir/fish_plugins $__fish_config_dir/fish_plugins.copy
and mv $__fish_config_dir/fish_plugins.copy $__fish_config_dir/fish_plugins
and fisher list | fisher remove
and not is-installed $tool
and echo "Uninstallation complete.✅"
or echo "Uninstallation failed.🟥"