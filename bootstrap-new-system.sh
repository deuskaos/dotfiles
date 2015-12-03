

dotfiles="$HOME/.dotfiles"

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

# if [[ `uname` == 'Darwin' ]]; then

#   echo 'Enter new hostname of the machine (e.g. macbook-paulmillr)'
#   read hostname
#   echo "Setting new hostname to $hostname..."
#   scutil --set HostName "$hostname"
#   compname=$(sudo scutil --get HostName | tr '-' '.')
#   echo "Setting computer name to $compname"
#   scutil --set ComputerName "$compname"
#   sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$compname"

# fi

# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# git clone --recursive git://github.com/kiroushi/dotfiles.git .dotfiles

if [[ `uname` == 'Darwin' ]]; then

  # Package Control
  pc="Package Control.sublime-package"
  link "$dotfiles/sublime/Packages/Package Control/$pc" "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/$pc"

    for setting in $dotfiles/sublime/Packages/User/*.sublime-settings; do
      link "$setting" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/${setting##*/}"
    done

    for theme in $dotfiles/sublime/Packages/Theme*; do
      link "$theme" "$HOME/Library/Application Support/Sublime Text 3/Packages/${theme##*/}"
    done

    for scheme in $dotfiles/sublime/color-schemes/*.tmTheme; do
        link "$scheme" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/${scheme##*/}"
    done
fi
