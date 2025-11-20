#!/usr/bin/env fish

echo "Syncing `ghostty` configuration.."

if test -L $HOME/.config/ghostty

    echo "Existing symbolic link to:"

    set_color yellow
    echo (readlink $HOME/.config/ghostty)
    set_color normal

else if test -d $HOME/.config/ghostty

    echo "Found existing `ghostty` config. Archiving.."
    mkdir -p ./archive
    mv $HOME/.config/ghostty ./archive/(date +%Y%m%d%H%M%S)

end

if test ! -e $HOME/.config/ghostty

    echo "Creating symbolic link with `ghostty` config.."
    ln -s $PWD/config $HOME/.config/ghostty

end

echo "Done.✨"
