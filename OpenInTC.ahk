#Requires AutoHotkey v2.0
#SingleInstance Force

; Ctrl+T в окне проводника — открыть текущую папку в Total Commander
#HotIf WinActive("ahk_class CabinetWClass")
^t:: {
    hwnd := WinGetID("A")
    for window in ComObject("Shell.Application").Windows {
        try {
            if (window.HWND = hwnd) {
                path := window.Document.Folder.Self.Path
                Run '"C:\Program Files\TotalCommander\TOTALCMD64.EXE" /O /T /R="' path '"'
                return
            }
        }
    }
}
#HotIf