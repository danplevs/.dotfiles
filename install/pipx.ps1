python -m pip install --user pipx
Set-Location $env:USERPROFILE/AppData/Roaming/Python/Python310/Scripts
./pipx ensurepath

# Install packages
$Packages = 'black', 'ipython', 'poetry', 'pytest'
foreach ($Package in $Packages) {
    pipx install $Package
}
