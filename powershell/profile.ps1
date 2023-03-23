# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
Import-Module posh-git
Import-Module Terminal-Icons

# Oh-my-posh
$omp_config = Join-Path $PSScriptRoot "night-owl.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
$env:POSH_GIT_ENABLED = $true

# Conda
# (& "~/miniconda3/Scripts/conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression

# Scoop
$env:PATH += ";$env:USERPROFILE\scoop\shims"
$env:PSModulePath += ";$env:USERPROFILE\scoop\modules"

# Disable pwsh venv
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1

# Chocolatey
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"
$env:PATH="$env:PATH;C:\Users\daniel\AppData\Roaming\Python\Scripts"

# Alias
Set-Alias radian "~/miniconda3/envs/radian/Scripts/radian.exe"
Set-Alias r radian
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function touch {
  Param(
    [Parameter(Mandatory=$true)]
    [string]$Path
  )

  if (Test-Path -LiteralPath $Path) {
    (Get-Item -Path $Path).LastWriteTime = Get-Date
  } else {
    New-Item -Type File -Path $Path
  }
}
