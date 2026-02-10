#Requires AutoHotkey v2.0
#SingleInstance Force

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
#HotIf