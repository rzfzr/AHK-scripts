#Requires AutoHotkey v1+
#SingleInstance force
#Include C:\Users\capit\Desktop\GitGud\AHK-scripts\Class_Monitor-master\src\Class_Monitor.ahk

; for k, v in Monitor.GetBrightness() ; empty parameter
;     MsgBox % k ": " v

; Monitor.SetBrightness(0)

; Monitor.SetBrightness(100, "1")
; Monitor.SetBrightness(100, "2")

; Monitor.SetBrightness(0, "1")
; Monitor.SetBrightness(0, "2")

; Monitor.RestoreFactoryDefault("1")
; Monitor.RestoreFactoryDefault("2")
; 129
highLevel=129
lowLevel=1

^F6:: ; Ctrl+F6
    Monitor.SetGammaRamp(highLevel, highLevel, highLevel, "1")
    Monitor.SetGammaRamp(highLevel, highLevel, highLevel, "2")
return
; Monitor.SetBrightness(100, "1")
; Monitor.SetBrightness(100, "2")

^F5:: ; Ctrl+F5
    Monitor.SetGammaRamp(lowLevel, lowLevel, lowLevel, "1")
    Monitor.SetGammaRamp(lowLevel, lowLevel, lowLevel, "2")
return
; Monitor.SetBrightness(0, "1")
; Monitor.SetBrightness(0, "2")

; Monitor.SetBrightness(Monitor.GetBrightness("1")["current"]+10, "1")

; MsgBox % Monitor.GetBrightness("1")["current"]
