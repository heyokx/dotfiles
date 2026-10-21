alias la "ls -lAh"
alias k kubectl
alias l limactl

alias editor code
alias c "editor ."
alias p pnpm
alias dot-edit "code ~/.dotfiles"
alias fish-edit "editor ~/.config/fish"
alias term-edit "editor ~/.config/wezterm"
alias git-hot "git log --format=format: --name-only --since=12.month | egrep -v '^\$' | sort | uniq -c | sort -nr | head -50"

abbr -a gs git status -bs
abbr -a lh ls -lh
abbr -a gl git log --oneline
