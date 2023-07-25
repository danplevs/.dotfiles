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

# Scoop
$env:PATH += ";$env:USERPROFILE\scoop\shims"
$env:PSModulePath += ";$env:USERPROFILE\scoop\modules"

# Disable pwsh venv
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1


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
$env:PATH += ";$env:USERPROFILE\AppData\Roaming\Python\Scripts"

# Alias
Set-Alias sudo gsudo
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utils
$env:PATH += ";$env:USERPROFILE\.dotfiles\install"
$env:PATH += ";$env:USERPROFILE\.dotfiles\utils"

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
