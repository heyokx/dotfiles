#!/usr/bin/env fish

set -l curr_path (realpath (status dirname))

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish \
  | source && fisher install jorgebucaran/fisher
and echo "Install complete!"