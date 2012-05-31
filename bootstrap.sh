#!/bin/bash

echo "Backing up your ViM config..."
BAK=~/.vim.bak_`date "+%d%m%Y_%H%M%S"`
mkdir "$BAK"
for i in $HOME/.vim $HOME/.{,g}vimrc $HOME/.vim-addons ; do
  if [[ ( -e $i ) || ( -h $i ) ]]; then
    mv -v "$i" "$BAK"
  fi
done

echo "Fetch ViM-KickStart..."
curl -sS -L https://raw.github.com/v0n/vim-kickstart/master/vimrc -o ~/.vimrc

echo "Adding a sample addons list..."
curl -sS -L https://raw.github.com/v0n/vim-kickstart/master/sample_addons_lists/recommended.addons -o ~/.vim-addons

echo "Done. Just run ViM and enjoy!"
exit
