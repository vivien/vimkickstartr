#!/bin/sh

BAK=~/.vimbackup-`date "+%d%m%Y-%H%M%S"`
mkdir -v $BAK
for i in ~/.vim ~/.vimrc ~/.gvimrc
do
  [ -e $i -o -h $i ] && mv $i $BAK
done

curl -sS -L https://raw.github.com/v0n/vim-kickstart/master/vimrc -o ~/.vimrc
[ -e ~/.vim-addons ] || curl -sS -L https://raw.github.com/v0n/vim-kickstart/master/lists/default.addons -o ~/.vim-addons

exit
