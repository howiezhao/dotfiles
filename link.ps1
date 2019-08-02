# Link for Sublime
$sourcesublime = ($pwd).Path + "\sublimetext3\Preferences.sublime-settings"
$targetsublime = $env:APPDATA + "\Sublime Text 3\Packages\User\Preferences.sublime-settings"
New-Item -Path $targetsublime -ItemType SymbolicLink -Value $sourcesublime

# Link for PowerShell
$sourceps = ($pwd).Path + "\powershell\Microsoft.PowerShell_profile.ps1"
$targetps = $env:HOMEPATH + "\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
New-Item -Path $targetps -ItemType SymbolicLink -Value $sourceps