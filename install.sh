
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone --recursive git://github.com/kiroushi/dotfiles.git .dotfiles

sudo zsh symlink-dotfiles.sh
