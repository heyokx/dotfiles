alias la "ls -lAh"
alias k kubectl

alias editor cursor
alias c "editor ."
alias p pnpm
alias fish-edit "editor ~/.config/fish"
alias kitty-edit "editor ~/.config/kitty"
alias ghostty-edit "editor ~/.config/ghostty"
alias git-hot "git log --format=format: --name-only --since=12.month | egrep -v '^\$' | sort | uniq -c | sort -nr | head -50"

abbr -a gs git status -bs
abbr -a fe fish-edit
abbr -a ke kitty-edit
abbr -a lh ls -lh
abbr -a gc git checkout
abbr -a gcb git checkout -b
abbr -a gl git log --oneline
abbr -a gcm git commit -m
abbr -a gaa git add --all
abbr -a hb cd \$HOMEBASE_ROOT
