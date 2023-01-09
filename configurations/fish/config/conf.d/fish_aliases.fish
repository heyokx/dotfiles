alias la "ls -lA"
alias k kubectl
alias kcuc "kubectl config use-context"


alias pcd "cd (ghq list -p | peco)"
alias lfg "pull && code ."
alias fish-edit "code ~/.config/fish"
alias kitty-edit "code ~/.config/kitty"
alias git-hot "git log --format=format: --name-only --since=12.month | egrep -v '^\$' | sort | uniq -c | sort -nr | head -50"

abbr -a gs git status -bs
abbr -a fe fish-edit
abbr -a ke kitty-edit
abbr -a lh ls -lh
abbr -a gc git checkout
abbr -a gl git log --oneline
abbr -a gaa git add --all
