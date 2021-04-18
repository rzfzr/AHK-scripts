; autoexecute section:
Gui, -Caption
Gui, Add, ListView,, HOTKEY|COMMENT
for Index, Element in Hotkeys(Hotkeys)
    LV_Add("",Element.Hotkey, Element.Comment)
LV_ModifyCol()

; Hotkey to show|hide the GUI:
^#F12:: ; Gui hotkeys
    If (Toggle := !Toggle)
     Gui, Show, x0 y0
    else
     Gui, Cancel
return

; Read Hotkeys from Script File
Hotkeys(ByRef Hotkeys)
{
    FileRead, Script, %A_ScriptFullPath%
    Script :=  RegExReplace(Script, "ms`a)^\s*/\*.*?^\s*\*/\s*|^\s*\(.*?^\s*\)\s*")
    Hotkeys := {}
    Loop, Parse, Script, `n, `r
        if RegExMatch(A_LoopField,"^\s*(.*):`:.*`;\s*(.*)",Match)
        {
            if !RegExMatch(Match1,"(Shift|Alt|Ctrl|Win)")
            {
                StringReplace, Match1, Match1, +, Shift+
                StringReplace, Match1, Match1, <^>!, AltGr+
                StringReplace, Match1, Match1, <, Left, All
                StringReplace, Match1, Match1, >, Right, All 
                StringReplace, Match1, Match1, !, Alt+
                StringReplace, Match1, Match1, ^, Ctrl+
                StringReplace, Match1, Match1, #, Win+
            }
            Hotkeys.Push({"Hotkey":Match1, "Comment":Match2})
        }
    return Hotkeys
}