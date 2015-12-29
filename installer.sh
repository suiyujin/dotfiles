#!/bin/bash

function confirm_link () {
  echo "link $1? (y/n)"
  read answer
  case $answer in
    y)
      return 0
      ;;
    n)
      return 1
      ;;
    *)
      echo -e "cannot understand $answer.\n"
      confirm_link $1
      ;;
  esac
}

cd $(dirname $0)
for dotfile in .?*
do
  if [ "$dotfile" == '..' ] || [ "$dotfile" == '.git' ] || [ "$dotfile" == '.gitignore' ] || [ "$dotfile" == '.DS_Store' ]; then
    echo "not link : " $dotfile
    continue
  elif [ "$(uname -s)" == 'Linux' ] && [ "$dotfile" == '.Brewfile' ]; then
    echo "not link : " $dotfile
    continue
  fi

  confirm_link $dotfile
  if [ $? -eq 0 ]; then
    ln -is "$PWD/$dotfile" $HOME
    if [ $? -eq 0 ]; then
      echo "link : " $dotfile
    else
      echo "not link : " $dotfile
    fi
  else
    echo "not link : " $dotfile
  fi
done
