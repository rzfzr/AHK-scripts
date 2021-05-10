#Include %A_ScriptDir%\AHKHID.ahk


#SingleInstance Force
DetectHiddenWindows, ON

Soundbeep
Soundbeep

Gui, Font, cBlue
Gui, Add, Edit, 			h300 ReadOnly -VScroll vThatOne
Gui, Font, cRed
Gui, Add, Edit, x+10 	h300 ReadOnly -VScroll vThisOne
Gui, Show,, Two Keyboards

OnMessage( 0x00FF, "YouPressed")
SizeofRawInputDeviceList	:= A_PtrSize * 2
SizeofRawInputDevice		:= 8 + A_PtrSize
RIDI_DEVICENAME				:= 0x20000007
RIDI_DEVICEINFO				:= 0x2000000b
RIDEV_INPUTSINK				:= 0x00000100
RID_INPUT						:= 0x10000003
HWND := WinExist( "Two Keyboards" )
Res := DllCall( "GetRawInputDeviceList", "Ptr", 0, "UInt*", Kount, UInt, SizeofRawInputDeviceList)
VarSetCapacity( RawInputList, SizeofRawInputDeviceList * Kount)
Res := DllCall( "GetRawInputDeviceList", "Ptr", &RawInputList, "UInt*", Kount, "UInt", SizeofRawInputDeviceList)
KeyboardRegistered := 0
Loop % Kount 
{
	Handle := NumGet( RawInputList, ( A_Index - 1) * SizeofRawInputDeviceList, "UInt")
	Type := NumGet( RawInputList, (( A_Index - 1) * SizeofRawInputDeviceList) + A_PtrSize, "UInt")
	If (Type <> 1)
		Continue
	KBDCount ++
	KbD%KBDCount% := Handle		
	Res := DllCall( "GetRawInputDeviceInfo", "Ptr", Handle, "UInt", RIDI_DEVICENAME, "Ptr", 0, "UInt *", nLength)
	VarSetCapacity( Name, ( nLength + 1) * 2)
	Res := DllCall( "GetRawInputDeviceInfo", "Ptr", Handle, "UInt", RIDI_DEVICENAME, "Str", Name, "UInt*", nLength)
	Res := DllCall( "GetRawInputDeviceInfo", "Ptr", Handle, "UInt", RIDI_DEVICEINFO, "Ptr", 0, "UInt *", iLength)
	VarSetCapacity( Info, iLength)
	NumPut( iLength, Info, 0, "UInt")
	Res := DllCall( "GetRawInputDeviceInfo", "Ptr", Handle, "UInt", RIDI_DEVICEINFO, "UInt", &Info, "UInt *", iLength)
	VarSetCapacity( RawDevice, SizeofRawInputDevice, 0)
	NumPut( RIDEV_INPUTSINK, RawDevice, 4)
	NumPut( HWND, RawDevice, 8)
	DoRegister := 0
	If ( KeyboardRegistered = 0)
	{
		DoRegister := 1
		NumPut( 1, RawDevice, 0, "UShort")
		NumPut( 6, RawDevice, 2, "UShort")
		KeyboardRegistered := 1
	}
	If (DoRegister)
		Res := DllCall( "RegisterRawInputDevices", "Ptr", &RawDevice, "UInt", 1, "UInt", 8 + A_PtrSize ) 
}
Kount := 1 
Return

GuiClose:
Soundbeep
Soundbeep
ExitApp

YouPressed( wParam, lParam, msg, hwnd )
{
	Global
	Res := DllCall( "GetRawInputData", "UInt", lParam, "UInt", RID_INPUT, "Ptr", 0, "UInt *", Size, "UInt", 8 + A_PtrSize * 2)
	VarSetCapacity( Buffer, Size)
	Res := DllCall( "GetRawInputData", "UInt", lParam, "UInt", RID_INPUT, "Ptr", &Buffer, "UInt *", Size, "UInt", 8 + A_PtrSize * 2)
	If ( NumGet( Buffer, 0 * 4, "UInt") = 1)								
	{
		VKey := NumGet( Buffer, (14 + A_PtrSize * 2 ), "UShort")
		If ( NumGet( Buffer, (16 + A_PtrSize * 2 )) = 256 )    	
			{
			SetFormat, Integer, H					
			VKey += 0
			If ( NumGet( Buffer, 2 * 4, "UInt") = KbD1 ) 				
				ThisWay( GetKeyName( "vk" VKey) "`r`n")
			Else
				ThatWay( GetKeyName( "vk" VKey) "`r`n")				
			}
	}	
	Return
}
ThatWay( Text)
{
	GuiControlGet, 	ThatOne
	GuiControl,, 	ThatOne, % Text ThatOne 
	Return
}
ThisWay( Text)
{
	GuiControlGet,	ThisOne
	GuiControl,, 	ThisOne, % Text ThisOne 
	Return
}