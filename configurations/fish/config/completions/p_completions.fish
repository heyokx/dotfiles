# K8s completions
alias kcuc "kubectl config use-context"
set -l k8s_contexts (k config get-contexts -o name)
complete -c kcuc -f
complete -c kcuc -n "not __fish_seen_subcommand_from $k8s_contexts" -a "$k8s_contexts"
