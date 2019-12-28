#!/bin/bash
#A script to add this direcotry to ~/.bashrc or ~/.bash_profile

echo "Which OS are you using? Select number."
select os in "Linux" "MacOS" "quit"
do
  if [ "$REPLY" = "q" ] ; then
    echo "quit."
    exit 0
  fi
  if [ -z "$os" ] ; then
    continue
  elif [ $os == "Linux" ] ; then
    echo '' >> ~/.bashrc
    echo '#PATH for fs-scripts' >> ~/.bashrc
    echo "PATH=$PWD:\$PATH" >> ~/.bashrc
    echo "PATH for fs-scripts was added to ~/.bashrc"
    echo "Please close the terminal, re-open and run checkpath.sh."

    break

  elif [ $os == "MacOS" ] ; then
    echo '' >> ~/.bash_profile
    echo '#PATH for fs-scripts' >> ~/.bash_profile
    echo "PATH=$PWD:\$PATH" >> ~/.bash_profile
    echo "PATH for fs-scripts was added to ~/.bash_profile"
    echo "Please close the terminal, re-open and run checkpath.sh."

    break

  elif [ $os == "quit" ] ; then
     echo "quit."
     exit 0
  fi
done
