#Persistent
#SingleInstance
SetTimer, CheckWindowMove, 50  ; Check every 50 milliseconds

global lastWinId := ""
global lastWinPos := ""
global isMoving := false

CheckWindowMove:
{
    currentWinId := WinExist("A")  ; Get the active window
    WinGetPos, X, Y, Width, Height, ahk_id %currentWinId%  ; Get its position and size

    currentWinPos := X "|" Y "|" Width "|" Height  ; Create a string to compare positions
    if (currentWinId != lastWinId || currentWinPos != lastWinPos)
    {
        ; The active window has changed or its position/size has changed
        global lastWinId := currentWinId
        global lastWinPos := currentWinPos

        if (currentWinId = lastWinId && !isMoving)
        {
            ; The position of the window has changed, indicating a move operation
            ; Check if the right mouse button is not being held
            if (!GetKeyState("RButton", "P"))
            {
                isMoving := true
                Send, {Blind}{F15 Down}  ; Hold down F15 only if right click is not held
            }
        }
    }
    else if (isMoving)
    {
        ; The window has stopped moving
        isMoving := false
        Send, {Blind}{F15 Up}  ; Release F15
    }
    return
}
