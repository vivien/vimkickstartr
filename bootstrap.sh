#!/bin/bash

# Backup existing Vim files
echo "Backing up your ViM config..."
BAK=~/.vim.bak_`date "+%d%m%Y_%H%M%S"`
mkdir "$BAK"
for i in $HOME/.vim $HOME/.{,g}vimrc $HOME/.vim-addons ; do
  if [[ ( -e $i ) || ( -h $i ) ]]; then
    mv -v "$i" "$BAK"
  fi
done

echo "Fetch ViM-KickStart..."
wget https://raw.github.com/v0n/vim-kickstart/master/vimrc -O ~/.vimrc
wget https://raw.github.com/v0n/vim-kickstart/master/sample_addons_lists/recommended.addons -O ~/.vim-addons

echo "Done. Just run ViM and enjoy!"
exit
