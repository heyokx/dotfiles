#!/usr/bin/env fish

source ../../_functions/helpers.fish

set -l tool asdf
set -l dependencies "git,curl"

is-installed $tool
and echo "Tool is already installed!"
or check-all-dependencies --deps=$dependencies
