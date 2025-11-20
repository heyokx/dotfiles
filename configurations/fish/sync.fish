#!/usr/bin/env fish

echo "Syncing `fish` configuration.."

if test -L $HOME/.config/fish

  echo "Existing symbolic link to:"

  set_color yellow
  echo (readlink $HOME/.config/fish)
  set_color normal

else if test -d $HOME/.config/fish

  echo "Found existing `fish` config. Archiving.."
  mkdir -p ./archive
  mv $HOME/.config/fish ./archive/(date +%Y%m%d%H%M%S)

end

if test ! -e $HOME/.config/fish

  echo "Creating symbolic link with `fish` config.."
  ln -s $PWD/config $HOME/.config/fish

end

echo "Done.✨"