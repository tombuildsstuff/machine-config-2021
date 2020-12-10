#!/bin/bash

userProfile=$HOME
echo 'Home Directory is:' $userProfile

currentDir="$(pwd)"
echo 'Current Directory is:' $currentDir

dotFilesDir="$currentDir/dotfiles"
echo 'Dotfiles Directory is:' $dotFilesDir

# Clone oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ZPlug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Zsh themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

mkdir -p $userProfile/code/

go install github.com/tombuildsstuff/huawei-e5573-mifi-cli

echo "SymLinking Dotfiles.."
for filePath in "$dotFilesDir"/.*; do
  fileName=${filePath/$dotFilesDir\//""}
  symLinkPath=$userProfile/$fileName

  if [ "$fileName" == "." ]
  then
    continue
  fi

  if [ "$fileName" == ".." ]
  then
    continue
  fi

  echo "Removing File at $symLinkPath"
  rm -rf $symLinkPath

  echo "Creating Symlink for $filePath to $symLinkPath"
  ln -s $filePath $symLinkPath
done

scriptsDir="$currentDir/scripts"
echo "Scripts Directory is: $scriptsDir"

echo "SymLinking Scripts.."
for filePath in "$scriptsDir"/*.sh; do
  fileName=${filePath/$scriptsDir\//""}
  symLinkPath=$userProfile/$fileName

  if [ "$fileName" == "." ]
  then
    continue
  fi

  if [ "$fileName" == ".." ]
  then
    continue
  fi

  echo "Removing File at $symLinkPath"
  rm -rf $symLinkPath

  echo "Creating Symlink for $filePath to $symLinkPath"
  ln -s $filePath $symLinkPath
done
