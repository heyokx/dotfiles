#!/usr/bin/env fish

function _private_dep-check -d "Check if dep is present." -a dep
  is-installed $dep; or echo "Dependency $dep is missing.🟥"; and return 1
end

function check-all-dependencies -d "Check all dependencies."
  argparse --name="check-all-dependencies" "deps=+" -- $argv; or return
  set -q _flag_deps; set deps (string split "," $_flag_deps)
  for dep in $deps
    _private_dep-check $dep; or return 0
  end
  echo "Dependencies all present.✅"
end

function is-installed -d "Check if command is installed." -a command
  if type -q $command &> /dev/null
    return 0
  else 
    return 1
  end
end
