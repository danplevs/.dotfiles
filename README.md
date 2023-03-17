# .dotfiles
``` powershell
# Install scoop, basic packages, oh-my-posh and pwsh modules
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop install git
scoop bucket add extras
scoop bucket add nerd-fonts
scoop install sudo neovim posh-git gh fzf make terminal-icons CascadiaCode-NF https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json psreadline psfzf

# pyenv-win
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"

# Pipx
. ./.dotfiles/install/pipx.ps1

# Poetry
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | python -


# Dotfiles
git clone https://github.com/danplevs/.dotfiles.git

# Set powershell profile
echo ". '$env:USERPROFILE/.dotfiles/powershell/profile.ps1'" > $profile

# Create symlinks
sudo New-Item -Path ./.gitconfig -ItemType SymbolicLink -Value ./.dotfiles/.gitconfig
sudo New-Item -Path ./.condarc -ItemType SymbolicLink -Value ./.dotfiles/.condarc

# Chocolatey 
. ./.dotfiles/install/chocolatey.ps1
``` 
