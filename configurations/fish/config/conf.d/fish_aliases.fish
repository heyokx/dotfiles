alias la "ls -lAh"
alias k kubectl

alias c "code ."
alias p pnpm
alias fish-edit "code ~/.config/fish"
alias kitty-edit "code ~/.config/kitty"
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
abbr -a vm-nixos ssh \$USER'@'\$VM_NIXOS
abbr -a vm-code code --remote \$USER'@'\$VM_NIXOS
