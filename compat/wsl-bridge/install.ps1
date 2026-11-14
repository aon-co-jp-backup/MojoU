# MojoW installer (unofficial): checks WSL, installs pixi + Mojo inside WSL, adds bin\ to the user PATH.
param([switch]$NoPath)
$ErrorActionPreference = "Stop"
$distro = if ($env:MOJOW_DISTRO) { $env:MOJOW_DISTRO } else { "Ubuntu" }
if (-not (Get-Command wsl.exe -ErrorAction SilentlyContinue)) { throw "WSL is not installed. Run 'wsl --install' in an administrator PowerShell, reboot, then re-run." }
$list = (wsl.exe -l -q) -join "`n" -replace "`0",""
if ($list -notmatch [regex]::Escape($distro)) { throw "WSL distro '$distro' not found. Run 'wsl --install -d $distro' (or set MOJOW_DISTRO)." }
$sh = Join-Path $PSScriptRoot "scripts\install-in-wsl.sh"
$wslsh = '/mnt/' + $sh.Substring(0,1).ToLower() + ($sh.Substring(2).Replace([string][char]92,'/'))
wsl.exe -d $distro -- bash $wslsh
if ($LASTEXITCODE -ne 0) { throw "install in WSL failed" }
$bin = Join-Path $PSScriptRoot "bin"
if (-not $NoPath) {
$cur = [Environment]::GetEnvironmentVariable("Path","User")
if ($cur -notlike "*$bin*") { [Environment]::SetEnvironmentVariable("Path", "$cur;$bin", "User"); Write-Host "Added $bin to the user PATH (reopen the terminal)." }
}
Write-Host "Done. Try: mojow --version"
