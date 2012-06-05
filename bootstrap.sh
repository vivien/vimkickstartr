#!/bin/sh

echo "Backing up your ViM config..."
BAK=~/.vimbak-`date "+%d%m%Y-%H%M%S"`
mkdir $BAK
for i in ~/.vim ~/.vimrc ~/.gvimrc
do
  [ -e $i -o -h $i ] && mv -v $i $BAK
done

echo "Fetch ViM-KickStart..."
curl -sS -L https://raw.github.com/v0n/vim-kickstart/develop/vimrc -o ~/.vimrc

if ! [ -e ~/.vim-addons ]
then
  echo "Adding a sample addons list..."
  curl -sS -L https://raw.github.com/v0n/vim-kickstart/develop/lists/default.addons -o ~/.vim-addons
fi

echo "Done. Just run ViM and enjoy!"
exit
