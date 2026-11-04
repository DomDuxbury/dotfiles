#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc vim zshrc gitconfig tmux.conf tmux"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

mv ~/.config/sway/config ~/.config/sway/config_old
ln -s ~/dotfiles/sway/config ~/.config/sway/config
echo "Installed sway config."

mv ~/.config/sway/definitions.d/theme.conf ~/.config/sway/definitions.d/theme.conf_old
ln -s ~/dotfiles/sway/themes/theme.conf ~/.config/sway/definitions.d/theme.conf
echo "Installed sway theme."

mv ~/.config/sway/definitions.d/theme.night.conf_ ~/.config/sway/definitions.d/theme.night.conf_old
ln -s ~/dotfiles/sway/themes/theme.night.conf_ ~/.config/sway/definitions.d/theme.night.conf_
echo "Installed sway night theme."

mv ~/.config/foot/foot.ini ~/.config/foot/foot.ini_old
ln -s ~/dotfiles/sway/foot/foot.ini ~/.config/foot/foot.ini
echo "Installed foot config."

# Make vim backup swap and undo folders
mkdir -p $dir/vim
mkdir -p $dir/vim/_swap
mkdir -p $dir/vim/_backup
mkdir -p $dir/vim/_undo
