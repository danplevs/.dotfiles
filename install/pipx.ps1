python -m pip install --user pipx
pipx ensurepath

# Install packages
$Packages = 'blue', 'ignr', 'ipython', 'isort', 'poetry', 'prospector', 'pytest', 'pyinstaller'
foreach ($Package in $Packages) {
    pipx install $Package
}
