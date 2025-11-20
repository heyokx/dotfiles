function run-install -d "Run tool installation function." -a tool
  set -l log_prompt "[dotfiles/installation/$tool]"
  alias log "echo (set_color yellow) $log_prompt (set_color normal)"

  log "Installing.."
  source ../$tool/install/pre-install.fish
  and source ../$tool/install/install.fish
  and log "Installation complete.✅"
  or log "Installation failed.🟥"
end

function run-uninstall -d "Run tool uninstallation function." -a tool
  set -l log_prompt "[dotfiles/uninstallation/$tool]"
  alias log "echo (set_color yellow) $log_prompt (set_color normal)"

  log "Uninstalling.."
  source ../$tool/install/uninstall.fish
  and log "Uninstallation complete.✅"
  or log "Uninstallation failed.🟥"
end