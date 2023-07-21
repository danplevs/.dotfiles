python -m pip install --user pipx
pipx ensurepath

# Install packages
$Packages = 'poetry', 'blue', 'isort', 'prospector', 'ipython', 'pytest', 'safety', 'cookiecutter', 'conda-lock', 'pyinstaller'
foreach ($Package in $Packages) {
    pipx install $Package
}
