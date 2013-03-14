#!/bin/sh

BAK=~/.vimbackup-`date "+%d%m%Y-%H%M%S"`
mkdir $BAK
for i in ~/.vim ~/.vimrc ~/.gvimrc
do
  [ -e $i -o -h $i ] && mv $i $BAK
done

curl -sS -L https://raw.github.com/vivien/vimkickstartr/master/vimrc -o ~/.vimrc
[ -e ~/.vim-addons ] || curl -sS -L https://raw.github.com/vivien/vimkickstartr/master/lists/default.addons -o ~/.vim-addons

echo "Backup in $BAK"
echo "Done."

exit
