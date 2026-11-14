# MojoW: run the real Mojo (inside WSL) from Windows, translating paths. Unofficial.
#   mojow run hello.mojo | mojow build -I . x.mojo -o x | mojow --version
# Env: MOJOW_DISTRO (default Ubuntu), MOJOW_PROJECT (pixi project dir in WSL, default ~/.mojow)
$distro = if ($env:MOJOW_DISTRO) { $env:MOJOW_DISTRO } else { "Ubuntu" }
$proj = if ($env:MOJOW_PROJECT) { $env:MOJOW_PROJECT } else { '$HOME/.mojow' }

function ConvertTo-WslPath([string]$p) {
    if ($p -match '^[A-Za-z]:') { return '/mnt/' + $p.Substring(0,1).ToLower() + ($p.Substring(2).Replace([string][char]92,'/')) }
    return $p.Replace([string][char]92,'/')
}
function Quote([string]$s) { "'" + ($s -replace "'", "'\''") + "'" }

$out = @()
foreach ($a in $args) {
    # translate absolute Windows paths and existing relative file/dir arguments; leave flags and other values alone
    if ($a -match '^[A-Za-z]:') { $out += Quote (ConvertTo-WslPath $a) }
    elseif ($a -notmatch '^-' -and (Test-Path -LiteralPath $a -ErrorAction SilentlyContinue)) { $out += Quote (ConvertTo-WslPath $a) }
    else { $out += Quote $a }
}
$cwd = ConvertTo-WslPath (Get-Location).Path
$cmd = "export PATH=`"`$HOME/.pixi/bin:`$PATH`"; cd $(Quote $cwd) && pixi run --manifest-path $proj/pixi.toml mojo " + ($out -join ' ')
# pass the command base64-encoded: avoids Windows argument-quoting problems with wsl.exe
$b64 = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($cmd))
& wsl.exe -d $distro -- bash -c "echo $b64 | base64 -d | bash"
exit $LASTEXITCODE
