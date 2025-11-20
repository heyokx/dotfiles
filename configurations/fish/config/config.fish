if which brew &>/dev/null
    source (brew --prefix asdf)/libexec/asdf.fish
    source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Import local configs
if test -d $__fish_config_dir/local
    for local_file in $__fish_config_dir/local/*
        source $local_file
    end
end

if test -d $__fish_config_dir/installations
    for install_file in $__fish_config_dir/installations/*
        source $install_file
    end
end

source $__fish_config_dir/completions/p_completions.fish
