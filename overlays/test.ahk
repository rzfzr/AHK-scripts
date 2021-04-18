Gui, 99:+HwndhParent
Gui, 99:Add, Button,, This is the parent button
Gui, 99:Show, w600 h300
;------------------------------------------------------------------------
Gui, +HwndhChild -Caption +Border
Gui, Add, Tab2, Buttons w420 h30 vContainer AltSubmit, Mode1|Mode2

; You can also hide the Tab buttons, by specifing "w0 h0" options
; Gui, Add, Tab2, w0 h0 vContainer AltSubmit, Mode1|Mode2

Gui, Tab, 1
	Gui, Add, Button, xm Section gOnClick vBtn1, Do Foo
	Gui, Add, Button, gOnClick x+30, Undo Foo
	Gui, Add, Button, gOnClick x+30, Report Foo
	Gui, Add, Button, gOnClick x+30, Random Foo
Gui, Tab, 2
	GuiControlGet, Btn1, Pos
	Gui, Add, Button, x%Btn1X% y%Btn1Y% gOnClick, Do Foo 2
	Gui, Add, Button, gOnClick x+30, Undo Foo 2
	Gui, Add, Button, gOnClick x+30, Report Foo 2
	Gui, Add, Button, gOnClick x+30, Random Foo 2
	Gui, Add, Button, gOnClick x+30, Five Foo 2
Gui, Tab ; The following controls will not belong to any "Tab"
	Gui, Add, Button, xm y+80 gAddNewButton, Add New Button
;------------------------------------------------------------------------
DllCall("SetParent", "ptr", hChild, "ptr", hParent)
Gui, Show, x20 y100 NA

WinSet, Style, -0x80000000, ahk_id %hChild% ; Remove WS_POPUP style
WinSet, Style, +0x40000000, ahk_id %hChild% ; Add WS_CHILD style
Return

GuiClose:
ExitApp

OnClick:
	GuiControlGet, BtnText,, % A_GuiControl
	ToolTip(BtnText " clicked")
	GuiControl, -Default, % A_GuiControl
return

AddNewButton:
	GuiControlGet, TabIndex,, Container
	Gui, Tab, %TabIndex%

	if !NewBtn_%TabIndex% {
		y := Btn1Y + 50
		Gui, Add, Button, x%Btn1X% y%y%, New button in Mode%TabIndex%
		NewBtn_%TabIndex% := true
	} else {
		MsgBox, Sorry`, but I'm too lazy to add new buttons
	}
return

ToolTip(Text, sec := 2) {
	ToolTip, % Text
	if sec
		SetTimer, ToolTip_Remove, % -1 * sec * 1000
	return

	ToolTip_Remove:
		ToolTip
	return
}