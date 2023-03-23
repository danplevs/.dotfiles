# Install packages

$Packages = 'blue', 'isort', 'prospector', 'ipython', 'pytest', 'safety', 'cookiecutter'
foreach ($Package in $Packages) {
    pipx install $Package
}
