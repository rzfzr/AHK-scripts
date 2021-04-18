#Include %A_ScriptDir%\AHKHID.ahk
#SingleInstance Force

Global _KEYBOARD_

;Create GUI
Gui +LastFound -Resize -MaximizeBox -MinimizeBox
Gui, Add, Edit, w1500 r15 vtxtres,

;Keep handle
GuiHandle := WinExist()

;Set up the constants
AHKHID_UseConstants()

; get keyboard events from all applications
AHKHID_Register(1, 6, GuiHandle, RIDEV_INPUTSINK)   

OnMessage(0x00FF, "InputMsg")

;Show GUI
Gui, Show
Return

GuiClose:
ExitApp

;===== HOTKEYS
r::
{     
    if (check_keyboard())
        s := "Rafael Figueira Goncalves"
    else
        s := "r"
    Suspend on    ; for avoid the hotkey
    SendInput %s%
    Suspend off
    Return     
}

;=============
check_keyboard()
{
    _KEYBOARD_ := ""
    t  := A_TickCount + 1000  ; 1000 ms awating to release the key
   while (_KEYBOARD_="")   ;for eternity until the condition is FALSE
   {
    	if (A_TickCount > t)   ;to avoid an infinite loop
    	    break
    } 
	; return InStr( _KEYBOARD_, "HID#{00001124-0000-1000-8000-00805f9b34fb}_VID&0002046d_PID&b342&Col01#9&28902c1e&1&0000#{884b96c3-56ef-11d1-bc8c-00a0c91405dd}")
	return InStr( _KEYBOARD_, "HID#VID_04B4&PID_0101&MI_00#8&22b77031&0&0000#{884b96c3-56ef-11d1-bc8c-00a0c91405dd}")
} 


InputMsg(wParam, lParam)
{
    Local r, h

    Critical    ;Or otherwise you could get ERROR_INVALID_HANDLE
  
    ;Get device type
    r := AHKHID_GetInputInfo(lParam, II_DEVTYPE)         
    if (r != RIM_TYPEKEYBOARD)      ; only keyboards
        return

    h := AHKHID_GetInputInfo(lParam, II_DEVHANDLE)
	_KEYBOARD_ := AHKHID_GetDevName(h,True)
}
