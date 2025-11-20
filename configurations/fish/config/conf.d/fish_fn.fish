# TODO: make function compatible with additional parameters
function kac -d "Fetch configmap from pods of a given namespace"
    set -l name $argv[1]
    set -l configmap (kubectl get pods -o json -n $name | jq -r -c '.items[0].spec.containers[0].envFrom[0].configMapRef.name')
    kubectl get configmap -n "$name" -o json $configmap | jq .data
end

function pcd -d "Git project utility"
    set -l project (ghq list -p | fzf --height=100% --layout=reverse)
    if contains $project (ghq list -p)
        cd $project
    end
end

function prm -d "Delete project from GHQ managed repositories"
    echo "Select a project to delete.."
    set -l project (ghq list -p | fzf --height=100% --layout=reverse)
    if contains $project (ghq list -p)
        echo "Are you sure you want to delete the project at path:"
        set_color yellow
        printf %s "'$project'"
        set_color normal
        echo "?"
        read -P "(y/N): " delete_project_prompt
        if test $delete_project_prompt = y
            echo "Deleting project.."
            rm -rf $project
            set_color green
            printf %s "Done:"
            set_color normal
            echo "$project 🗑️"
        else
            echo "Exiting.."
        end
    else
        echo "Exiting.."
    end
end

function refresh-fish -d "Refresh local fish config (~/.config/fish/config.fish)."
    source $__fish_config_dir/config.fish
end

function __get-wt-path
    set -l wt_branch $argv[1]
    echo (git worktree list | rg $wt_branch | string split ' ' -n)[1]
end

function __get-wt-status
    set -l wt_path (__get-wt-path $argv)
    git -C $wt_path status -bs
end

function wt -d "Git worktree utility"
    set -l wt_branches (__get_wt_branches)
    set -l wt_branch (__get_wt_branches | fzf --height=\~100% --layout=reverse --preview '__get-wt-status {}')
    if contains $wt_branch $wt_branches
        set -l wt_path (git worktree list | rg $wt_branch | string split ' ' -n)[1]
        cd $wt_path
    end
end

function wt-list -d "Git worktree state utility"
    git worktree list | awk '{ printf("%-40s %-20s %-20s\n", $3, $2, $1) }'
end

function wt-create -d "Git worktree creation utility" -a wt_name
    set -l git_repo_dir (basename (git rev-parse --show-toplevel))
    set -l wt_commit_hash (git rev-parse --short HEAD)
    set -l wt_create_time (date "+%Y%m%d%H%M%S")
    set -l wt_path $HOMEBASE_WORKSPACE"/"$git_repo_dir"-"$wt_commit_hash"-"$wt_create_time
    echo "Creating new worktree.."
    set_color yellow
    printf %s "(path: $wt_path, branch: '$wt_name')"
    set_color normal
    echo "?"
    read -P "(y/N):" create_wt_prompt
    if test $create_wt_prompt = y
        echo "Creating worktree.."
        git worktree add -b $wt_name $wt_path
        set_color green
        printf %s Done
        set_color normal
        echo "✨"
    else
        echo "Exiting.."
    end
end

function wt-qc -d "Git worktree quick create from existing branch" -a wt_name
    set -l git_repo_dir (basename (git rev-parse --show-toplevel))
    set -l wt_commit_hash (git rev-parse --short HEAD)
    set -l wt_create_time (date "+%Y%m%d%H%M%S")
    set -l wt_path $HOMEBASE_WORKSPACE"/"$git_repo_dir"-"$wt_commit_hash"-"$wt_create_time
    echo "Creating new worktree from existing branch.."
    set_color yellow
    printf %s "(path: $wt_path, branch: '$wt_name')"
    set_color normal
    echo "?"
    read -P "(y/N):" create_wt_prompt
    if test $create_wt_prompt = y
        echo "Creating worktree.."
        git worktree add --track $wt_path $wt_name
        set_color green
        printf %s Done
        set_color normal
        echo "✨"
    else
        echo "Exiting.."
    end
end

function wt-remove -d "Remove git worktree"
    echo "Select worktree to delete.."
    set -l wt_branches (__get_wt_branches)
    set -l wt_branch (__get_wt_branches| fzf --height=\~100% --layout=reverse)
    if contains $wt_branch $wt_branches
        set -l wt_path (git worktree list | rg $wt_branch | string split ' ' -n)[1]
        echo "Are you sure you want to delete the worktree:"
        set_color yellow
        printf %s "(path: $wt_path, branch: $wt_branch)"
        set_color normal
        echo "?"
        read -P "(y/N): " delete_wt_prompt
        if test $delete_wt_prompt = y
            echo "Deleting worktree.."
            git worktree remove -f $wt_path && git branch -D $wt_branch
            set_color green
            printf %s "Done:"
            set_color normal
            echo "$wt_branch 🗑️"
        else
            echo "Exiting.."
        end
    end
end

function gb-remove -d "Remove local git branch"
    echo "Select local branch to delete.."
    set -l branch (git branch -l --format '%(refname:short)' | fzf --height=\~100% --layout=reverse)
    if contains $branch (git branch -l --format '%(refname:short)')
        echo "Are you sure you want to delete the local branch:"
        set_color yellow
        printf %s "'$branch'"
        set_color normal
        echo "?"
        read -P "(y/N): " delete_branch_prompt
        if test $delete_branch_prompt = y
            echo "Deleting branch.."
            git branch -D $branch
            set_color green
            printf %s "Done:"
            set_color normal
            echo "$branch 🗑️"
        else
            echo "Exiting.."
        end
    end
end

function __get_wt_branches -d "Helper for worktree utility commands"
    for wt_branch in (git worktree list --porcelain | rg '^branch (.*)' -r '$1')
        basename $wt_branch
    end
end

function fish_greeting -d "Personal fish greeting"
    echo "  Logged on.."
    echo "  ✍️" $USER
    echo "  🖥️" $hostname
end

function krestart -d "Safely restarts all deployment pods within a namespace"
    argparse -N 1 -X 2 -- $argv
    or return

    set -l namespace $argv[1]
    set -l deployment $argv[2]

    if test -n "$deployment"
        echo "Deployment specific rollout restart.."
        kubectl rollout restart -n $namespace deployment/$deployment
    else
        echo "Namespace rollout restart.."
        for name in (kubectl get deployments -n $namespace -o name)
            echo "Rollout restart for ns:$namespace d:$name.."
            kubectl rollout restart -n $namespace "$name"
        end
    end
end

function opr -d "Open git PR for current HEAD with remote origin HEAD"
    set -l git_remote_origin_url \
        (git config remote.origin.url | sed 's/git@\(.*\):\(.*\).git/https:\/\/\1\/\2/' | sed 's/ssh:\/\/git@\(.*\).git/https:\/\/\1/' | sed 's/\.git//g')
    set -l remote_origin_head (git symbolic-ref refs/remotes/origin/HEAD | awk -F '/' '{print $NF}')
    set -l current_head (git rev-parse --abbrev-ref HEAD)
    set -l pr_url_options "expand=1&assignees="(git config --get github.username)
    set -l git_pr_remote_url $git_remote_origin_url/compare/$remote_origin_head...$current_head"?"$pr_url_options
    echo "Opening PR.. "$git_pr_remote_url
    open $git_pr_remote_url
end
