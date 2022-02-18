# .dotfiles
``` powershell
# Install scoop and some basic packages
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop bucket add extras
scoop install sudo neovim git gh fzf pyenv

git clone https://github.com/danplevs/.dotfiles.git

# Chocolatey
. ./.dotfiles/install/chocolatey.ps1

# Oh-my-posh and PowerShell modules
. ./.dotfiles/install/modules.ps1

# Pyenv
. ./.dotfiles/install/pyenv.ps1

# Pipx
. ./.dotfiles/install/pipx.ps1

# Set powershell profile
echo ". '$env:USERPROFILE/.dotfiles/powershell/profile.ps1'" > $profile

# Create symlinks
sudo New-Item -Path ./.gitconfig -ItemType SymbolicLink -Value ./.dotfiles/.gitconfig
sudo New-Item -Path ./.condarc -ItemType SymbolicLink -Value ./.dotfiles/.condarc
``` 
