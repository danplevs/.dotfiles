python -m pip install --user pipx
Set-Location $env:USERPROFILE/AppData/Roaming/Python/Python310/Scripts
./pipx ensurepath

# Install packages
$Packages = 'blue', 'isort', 'prospector', 'mypy', 'sphinx', 'ipython', 'pytest', 'safety', 'cookiecutter', 'conda-lock'
foreach ($Package in $Packages) {
    pipx install $Package
}
