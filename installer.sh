#!/bin/bash
cd $(dirname $0)
for dotfile in .?*
do
  if [ "$dotfile" == '..' ] || [ "$dotfile" == '.git' ] || [ "$dotfile" == '.gitignore' ] || [ "$dotfile" == '.DS_Store' ]; then
    echo "not link : " $dotfile
    continue
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ] && [ "$dotfile" == '.Brewfile' ]; then
    echo "not link : " $dotfile
    continue
  fi
  ln -is "$PWD/$dotfile" $HOME
done
