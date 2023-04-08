#!/usr/bin/env fish

echo "Syncing `kitty` configuration.."

if test -L $HOME/.config/kitty

  echo "Existing symbolic link to:"

  set_color yellow
  echo (readlink $HOME/.config/kitty)
  set_color normal

else if test -d $HOME/.config/kitty

  echo "Found existing `kitty` config. Archiving.."
  mkdir -p ./archive
  mv $HOME/.config/kitty ./archive/(date +%Y%m%d%H%M%S)

end

if test ! -e $HOME/.config/kitty

  echo "Creating symbolic link with `kitty` config.."
  ln -s $PWD/config $HOME/.config/kitty

end

echo "Done.✨"