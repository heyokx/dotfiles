#!/usr/bin/env fish

source ../../_functions/helpers.fish

set -l tool fisher
set -l dependencies "curl"

is-installed $tool
and echo "Tool is already installed!"
or check-all-dependencies --deps=$dependencies \
&& echo "Pre-install complete!" \
|| echo "Pre-install failed!"
