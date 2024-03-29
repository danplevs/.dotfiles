# .dotfiles
``` powershell
# Install scoop, basic packages, oh-my-posh and pwsh modules
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop install git
scoop bucket add extras
scoop bucket add nerd-fonts
scoop install 7zip fzf gh grep gsudo neovim oh-my-posh posh-git powertoys psfzf psreadline pyenv terminal-icons

# Oh my posh
oh-my-posh font install CascadiaCode 
# add CaskaydiaCove NF in windows terminal config

# Dotfiles
git clone https://github.com/danplevs/.dotfiles.git

# pyenv-win
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"

# Pipx
. ./.dotfiles/install/pipx.ps1

# Poetry fix pylint-flask installation
poetry self update 1.4.1

# Set powershell profile
echo ". '$env:USERPROFILE/.dotfiles/powershell/profile.ps1'" > $profile

# Create symlinks
gsudo New-Item -Path ./.gitconfig -ItemType SymbolicLink -Value ./.dotfiles/.gitconfig
gsudo New-Item -Path ./.condarc -ItemType SymbolicLink -Value ./.dotfiles/.condarc

# Chocolatey 
gsudo . ./.dotfiles/install/chocolatey.ps1
``` 
