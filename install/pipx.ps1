python -m pip install --user pipx
Set-Location $env:USERPROFILE/AppData/Roaming/Python/Python310/Scripts
./pipx ensurepath

# Install packages
$Packages = 'blue', 'isort', 'mkdocs', 'prospector', 'mypy', 'ipython', 'poetry', 'pytest', 'safety'
foreach ($Package in $Packages) {
    pipx install $Package
}
