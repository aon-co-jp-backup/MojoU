# MojoU (FUSION)

**日本語**: Mojo風の言語。見た目はPython構文、中身はRust(C++なし)。旧 MojoW / MojoL / MojoM / MojoA / Mojoi を1つに統合したもの。
プラットフォームごとの違いは**インストーラーだけ**(ソースは共通)。

**English**: A Mojo-style language: Python syntax on the surface, memory-safe Rust inside (no C++). The fusion of MojoW / MojoL / MojoM / MojoA / Mojoi. The platforms differ **only in the installer**; the source is shared.

```
mojou run hello.py        mojou --version
```

## Installers
| Platform | Installer | Status |
|---|---|---|
| Windows x64 | `installers/windows/mojou.iss` -> `MojoU-Setup.exe` (per-user, PATH) | built by CI |
| Linux x86_64 / aarch64 | `installers/linux/install.sh` (tar.gz) | built by CI |
| macOS Intel / Apple silicon | `installers/macos/install.sh` (tar.gz) | built by CI, unsigned |
| Android aarch64 | `installers/android/install.sh` (Termux / adb) | built by CI, not tested on a device |
| iOS | `installers/ios/README.md` | compile check only |

`compat/wsl-bridge/` keeps the old MojoW feature (run the *official* Mojo inside WSL from Windows; unofficial).

## Scope / limits (honest)
Subset of Python syntax; 64-bit integers (overflow is an error); no lists/dicts/classes/closures yet. Typed `int -> int` functions are compiled
(about 1.6-1.9x faster than CPython 3.14 on fib/collatz); untyped code is slower than CPython. Tests: `tests/run.py` compares output with CPython (differences=0).
