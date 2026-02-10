# Open in Total Commander from Windows Explorer

A lightweight AutoHotkey script that adds a **Ctrl+T** shortcut to Windows File Explorer, instantly opening the current folder in Total Commander.

## Requirements

- Windows 10/11
- [AutoHotkey v2.0+](https://www.autohotkey.com/)
- [Total Commander](https://www.ghisler.com/) (64-bit) installed at the default location

## Installation

1. Install [AutoHotkey v2.0](https://www.autohotkey.com/) if you don't have it already.
2. Download or clone this repository.
3. Double-click `OpenInTC.ahk` to run the script.

### Run on startup (optional)

To start the script automatically with Windows:

1. Press **Win+R**, type `shell:startup`, and press Enter.
2. Create a shortcut to `OpenInTC.ahk` in the Startup folder that opened.

## Usage

1. Open any folder in **Windows File Explorer**.
2. Press **Ctrl+T**.
3. The same folder opens in **Total Commander** (right panel, new tab).

The hotkey only works when an Explorer window is focused — it won't interfere with other applications.

## Configuration

### Custom Total Commander path

If Total Commander is installed in a non-default location, edit line 12 in `OpenInTC.ahk` and replace the path:

```ahk
Run '"C:\your\path\to\TOTALCMD64.EXE" /O /T /R="' path '"'
```

### Total Commander flags

| Flag | Meaning |
|------|---------|
| `/O` | If TC is already running, reuse the existing instance |
| `/T` | Open in a new tab |
| `/R=` | Open the path in the **right** panel |

Change `/R=` to `/L=` if you prefer the folder to open in the left panel.

## License

This project is released into the public domain. Use it however you like.
