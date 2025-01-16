#Requires AutoHotkey v2.0
#SingleInstance Force

global ConfigFile := A_ScriptDir . "\Shortcuts.ini"
global Shortcuts := Map()

Mygui := Gui()
Mygui.OnEvent('Close', (*) => ExitApp())
Mygui.Add("Text", , "Press shortcut:")
vShortcutHotkey := Mygui.AddHotkey()
Mygui.Add("Text", , "Type regex:")
vShortcutText := Mygui.Add("Edit", "w300")

Btn := Mygui.AddButton("Default w80", "Add shortcut")
Btn.OnEvent("Click", AddShortcut)

DelBtn := Mygui.AddButton("Default w80", "Delete shortcut")
DelBtn.OnEvent("Click", DeleteShortcut)

LV := Mygui.AddListView("r10 w400 Grid", ["Shortcut", "Regex"])
LoadShortcuts()
Lv.OnEvent("ItemFocus", SelectShortcut)

SaveBtn := Mygui.AddButton("Default w80", "Save config")
SaveBtn.OnEvent("Click", Save)

HideBtn := Mygui.AddButton("Default w80", "Hide and activate")
HideBtn.OnEvent("Click", HideAndActivate)

Mygui.Show()

SelectShortcut(GuiCtrl, Row) {
    vShortcutHotkey.Value := lv.GetText(row, 1)
    vShortcutText.Value := lv.GetText(row, 2)
    Sleep 100
    vShortcutHotkey.Focus()
}

HideAndActivate(GuiCtrl, Info) {
    global Shortcuts
    if WinExist('ahk_id ' Mygui.hwnd) {
        for hk, text in Shortcuts {
            Hotkey(hk, HandleShortCut)
        }
        Mygui.Hide()
    }
    else {
        for hk, text in Shortcuts {
            Hotkey(hk, , "Off")
        }
        Mygui.Show()
    }
    return

}

*F1:: HideAndActivate(0, 0)

AddShortcut(GuiCtrl, Info) {

    Mygui.Submit(0)
    if (vShortcutHotkey.Value = "" or vShortcutText.Value = "") {
        MsgBox("Error: Empty fields")
        return
    }
    Shortcuts[vShortcutHotkey.Value] := vShortcutText.Value
    Lv.Delete()
    for hk, text in Shortcuts {
        lv.Add(, hk, text)
    }

    vShortcutHotkey.Value := ""
    vShortcutText.Value := ""
    vShortcutHotkey.Focus()
}

Save(GuiCtrl, Info) {

    if (FileExist(ConfigFile)) {
        FileDelete(ConfigFile)
    }

    for hk, text in Shortcuts {
        FileAppend(hk "=" text "`n", ConfigFile)
    }

}

HandleShortCut(ThisHotkey) {
    hk := ThisHotkey
    text := Shortcuts[hk]

    OldClipboard := ClipboardAll()

    A_Clipboard := text
    ClipWait
    Send('^f')
    Sleep(100)
    Send("^v")
    Sleep(100)
    A_Clipboard := OldClipboard
    return
}

LoadShortcuts() {
    global ConfigFile, Shortcuts
    if !FileExist(ConfigFile)
        return
    loop read ConfigFile {
        if InStr(A_LoopReadLine, "=") {
            Hk := Trim(StrSplit(A_LoopReadLine, "=")[1])
            Text := Trim(StrSplit(A_LoopReadLine, "=")[2])
            Shortcuts[Hk] := Text
            Lv.Add(, Hk, Text)
        }
    }
}

DeleteShortcut(GuiCtrl, Info) {
    Row := LV.GetNext()
    if (Row = 0) {
        MsgBox "Error: Select the shortcut first."
        return
    }
    hk := Lv.GetText(Row, 1)
    Shortcuts.Delete(hk)
    lv.Delete(Row)
}
