#Persistent
Loop, 255
Hotkey, % "~" Format("vk{:x}",A_Index), pressed, On
return

pressed:
Tooltip % ""  GetKeyName(SubStr(A_ThisHotkey,2))
return