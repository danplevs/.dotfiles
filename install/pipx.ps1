python -m pip install --user pipx
Set-Location $env:USERPROFILE/AppData/Roaming/Python/Python311/Scripts
./pipx ensurepath

# Install packages
$Packages = 'poetry', 'blue', 'isort', 'prospector', 'ipython', 'pytest', 'safety', 'cookiecutter', 'conda-lock'
foreach ($Package in $Packages) {
    pipx install $Package
}
