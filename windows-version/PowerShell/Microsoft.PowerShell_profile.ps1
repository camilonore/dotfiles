fnm env --use-on-cd | Out-String | Invoke-Expression
oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/amro.omp.json" | Invoke-Expression

# Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Function OpenPwshConfig { vim $PROFILE }
Set-Alias -Name config -Value OpenPwshConfig

Function OpenVimConfig { Set-Location ~\AppData\Local\nvim\lua\custom; vim }
Set-Alias -Name vimconfig -Value OpenVimConfig

Function OpenDevFolder { Set-Location ~/dev/ }
Set-Alias -Name dev -Value OpenDevFolder

Function GoToDocuments { Set-Location C:/Users/caminore/Documents }
Set-Alias -Name docs -Value GoToDocuments

Set-Alias -Name vim -Value nvim
Set-Alias -Name cat -Value bat

Function Up { Set-Location -Path .. }
Set-Alias -Name '..' -Value Up

# Git and Github Aliases
Function GitStatus { git status }
Set-Alias -Name gst -Value GitStatus -Force -Option AllScope

Function GitAdd { git add --all }
Set-Alias -Name gaa -Value GitAdd -Force -Option AllScope

Function GitCommitMessage { git commit -m $args }
Set-Alias -Name gcm -Value GitCommitMessage -Force -Option AllScope

Function GitPush { git push origin main }
Set-Alias -Name gps -Value GitPush -Force -Option AllScope

Function GitPull { git pull origin main }
Set-Alias -Name gpl -Value GitPull -Force -Option AllScope

Function GitTree { & git log --graph --oneline --decorate $args }
New-Alias -Name gtree -Value GitTree -Force -Option AllScope

# Clear the screen with Ctrl+O
Set-PSReadLineKeyHandler -Key Ctrl+o -Function ClearScreen

# Set the default directory to the user's home directory if is the first time running PowerShell
if ($env:PWD.Path -eq $env:USERPROFILE) {
  Set-Location ~
}

# github-copilot-cli config
function ?? { 
  $TmpFile = New-TemporaryFile
  github-copilot-cli what-the-shell ('use powershell to ' + $args) --shellout $TmpFile
  if ([System.IO.File]::Exists($TmpFile)) { 
    $TmpFileContents = Get-Content $TmpFile
    if ($TmpFileContents -ne $nill) {
      Invoke-Expression $TmpFileContents
      Remove-Item $TmpFile
    }
  }
}

function git? {
  $TmpFile = New-TemporaryFile
  github-copilot-cli git-assist $args --shellout $TmpFile
  if ([System.IO.File]::Exists($TmpFile)) {
    $TmpFileContents = Get-Content $TmpFile
    if ($TmpFileContents -ne $nill) {
      Invoke-Expression $TmpFileContents
      Remove-Item $TmpFile
    }
  }
}

function gh? {
  $TmpFile = New-TemporaryFile
  github-copilot-cli gh-assist $args --shellout $TmpFile
  if ([System.IO.File]::Exists($TmpFile)) {
    $TmpFileContents = Get-Content $TmpFile
    if ($TmpFileContents -ne $nill) {
      Invoke-Expression $TmpFileContents
      Remove-Item $TmpFile
    }
  }
}
