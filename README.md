# .dotfiles
``` powershell
# Install scoop and some basic packages
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop bucket add extras
scoop bucket add nerd-fonts
scoop install sudo neovim git posh-git gh fzf pyenv

# Oh-my-posh
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json

git clone https://github.com/danplevs/.dotfiles.git

# Chocolatey
. ./.dotfiles/install/chocolatey.ps1

# Terminal-Icons and Nerd Font
choco install terminal-icons.powershell
scoop install CascadiaCode-NF

# Oh-my-posh and PowerShell modules
. ./.dotfiles/install/modules.ps1

# Pipx
. ./.dotfiles/install/pipx.ps1

# Set powershell profile
echo ". '$env:USERPROFILE/.dotfiles/powershell/profile.ps1'" > $profile

# Create symlinks
sudo New-Item -Path ./.gitconfig -ItemType SymbolicLink -Value ./.dotfiles/.gitconfig
sudo New-Item -Path ./.condarc -ItemType SymbolicLink -Value ./.dotfiles/.condarc
``` 
