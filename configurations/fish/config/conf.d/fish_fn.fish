# TODO: make function compatible with additional parameters
function kac -d "Fetch configmap from pods of a given namespace"
    set -l name $argv[1]
    set -l configmap (kubectl get pods -o json -n $name | jq -r -c '.items[0].spec.containers[0].envFrom[0].configMapRef.name')
    kubectl get configmap -n "$name" -o json $configmap | jq .data
end

function prm -d "Delete project from GHQ managed repositories"
    echo "Select a project to delete.."
    set -l project (ghq list -p | fzf --height=\~100% --layout=reverse)
    if contains $project (ghq list -p)
        echo "Are you sure you want to delete the project at path:"
        set_color yellow
        printf %s "'$project'"
        set_color normal
        echo "?"
        read -P "(y/N): " delete_project_prompt
        if test $delete_project_prompt = y
            echo "Deleting project.."
            rm -r $project
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
