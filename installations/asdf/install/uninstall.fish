#!/usr/bin/env fish

set -l tool asdf

echo "Uninstalling $tool.."

rm -f $fish_config/completions/asdf.fish
and rm -f $fish_config/installations/asdf.fish
and rm -rf $HOME/.asdf
and echo "Uninstallation complete.✅"
or echo "Uninstallation failed.🟥"