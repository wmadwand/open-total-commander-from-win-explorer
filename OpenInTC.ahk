#Requires AutoHotkey v2.0
#SingleInstance Force

; Auto-elevate to admin (required for dialogs in VS, Unity, etc.)
if !A_IsAdmin {
    try Run '*RunAs "' A_ScriptFullPath '"'
    ExitApp
}

OpenInTC(path) {
    if (path = "") {
        MsgBox "Failed to get folder path"
        return
    }

    tc := "C:\Program Files\TotalCommander\TOTALCMD64.EXE"
    cmd := Format('"{1}" /O /T "/R={2}"', tc, path)

    try {
        Run cmd
    } catch as e {
        MsgBox "Launch error: " e.Message "`n" cmd
        return
    }

    if WinWait("ahk_class TTOTAL_CMD",, 3) {
        Sleep 200
        WinActivate "ahk_class TTOTAL_CMD"
    }
}

; Ctrl+T in Explorer window
#HotIf WinActive("ahk_class CabinetWClass")
^t:: {
    hwnd := WinGetID("A")
    path := ""
    for window in ComObject("Shell.Application").Windows {
        try {
            if (window.HWND = hwnd) {
                path := window.Document.Folder.Self.Path
                break
            }
        }
    }
    OpenInTC(path)
}
#HotIf

; Ctrl+T in Open/Save dialog
#HotIf WinActive("ahk_class #32770")
^t:: {
    KeyWait "Ctrl"
    KeyWait "t"

    clipSave := ClipboardAll()
    A_Clipboard := ""

    SendEvent "!d"
    Sleep 500
    SendEvent "^a"
    Sleep 100
    SendEvent "^c"
    if !ClipWait(2) {
        A_Clipboard := clipSave
        MsgBox "Failed to get folder path"
        return
    }

    path := A_Clipboard
    A_Clipboard := clipSave

    SendEvent "{Escape}"

    OpenInTC(path)
}
#HotIf