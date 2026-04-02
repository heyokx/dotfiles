#!/usr/bin/env fish

echo "Syncing `.agents` configuration.."

if test -L $HOME/.agents

    echo "Existing symbolic link to:"

    set_color yellow
    echo (readlink $HOME/.agents)
    set_color normal

else if test -d $HOME/.agents

    echo "Found existing `.agents` config. Archiving.."
    mkdir -p ./archive
    mv $HOME/.agents ./archive/(date +%Y%m%d%H%M%S)

end

if test ! -e $HOME/.agents

    echo "Creating symbolic link with `.agents` config.."
    ln -s $PWD/config $HOME/.agents

end

echo "Done.✨"
