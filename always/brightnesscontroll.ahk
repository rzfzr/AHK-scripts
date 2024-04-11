#Requires AutoHotkey v1+
#SingleInstance force
#Include %A_ScriptDir%\..\Class_Monitor-master\src\Class_Monitor.ahk

highLevel := 129
lowLevel := 1
stepSize := (highLevel - lowLevel) // 6
currentLevel := highLevel

AdjustGamma(newLevel) {
    global highLevel, lowLevel, currentLevel
    if (newLevel < lowLevel)
        newLevel := lowLevel
    else if (newLevel > highLevel)
        newLevel := highLevel

    currentLevel := newLevel

    Monitor.SetGammaRamp(newLevel, newLevel, newLevel, "1")
    Monitor.SetGammaRamp(newLevel, newLevel, newLevel, "2")
}

^F6:: ; Ctrl+F6
    currentLevel += stepSize
    AdjustGamma(currentLevel)
return

^F5:: ; Ctrl+F5
    currentLevel -= stepSize
    AdjustGamma(currentLevel)
return
