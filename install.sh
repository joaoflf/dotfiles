
#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$HOME/dotfiles                    # dotfiles directory
files="gitconfig zshrc tmux.conf"    # list of files/folders to symlink in homedir

##########

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Deleting existing $file"
    rm $HOME/.$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file $HOME/.$file
done

install_zsh () {
# If zsh isn't installed, get the platform of the current machine
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    echo "zsh already installed"
else
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    fi
fi

}

install_zsh


