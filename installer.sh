#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ] && [ $dotfile != '.DS_Store' ]
    then
      if [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ] && [ $dotfile != '.Brewfile' ]
      then
        ln -is "$PWD/$dotfile" $HOME
      fi
    fi
done
