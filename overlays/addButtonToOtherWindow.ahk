
ComObjCreate("Shell.Application").FileRun()
WinWait, ahk_class #32770 ahk_exe explorer.exe
hParent := WinExist()

Gui, +HwndhChild -Caption
Gui, Add, Button, , AHK_Button
DllCall("SetParent", "ptr", hChild, "ptr", hParent)
Gui, Show, x20 y0 NA

WinSet, Style, -0x80000000, ahk_id %hChild% ; Remove WS_POPUP style
WinSet, Style, +0x40000000, ahk_id %hChild% ; Add WS_CHILD style
return



