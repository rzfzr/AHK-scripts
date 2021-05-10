#SingleInstance, Force

showOverlay = 0
Gui, +toolwindow +resize -caption +alwaysontop
Gui, color , ffffff 

Gui, Add, Button, x0 w60 h60, ESC
Gui, Add, Button, x+0 w60 h60, F1
Gui, Add, Button, x+0 w60 h60, F2
Gui, Add, Button, x+0 w60 h60, F3
Gui, Add, Button, x+0 w60 h60, F4
Gui, Add, Button, x+0 w60 h60, F5
Gui, Add, Button, x+0 w60 h60, F6
Gui, Add, Button, x+0 w60 h60, F7
Gui, Add, Button, x+0 w60 h60, F8
Gui, Add, Button, x+0 w60 h60, F9
Gui, Add, Button, x+0 w60 h60, F10
Gui, Add, Button, x+0 w60 h60, F11
Gui, Add, Button, x+0 w60 h60, F12
Gui, Add, Button, x+0 w60 h60, INS
Gui, Add, Button, x+0 w60 h60, DEL

Gui, Add, Button, x0 w60 h60, ~
Gui, Add, Button, x+0 w60 h60, 1
Gui, Add, Button, x+0 w60 h60, 2
Gui, Add, Button, x+0 w60 h60, 3
Gui, Add, Button, x+0 w60 h60, 4
Gui, Add, Button, x+0 w60 h60, 5
Gui, Add, Button, x+0 w60 h60, 6
Gui, Add, Button, x+0 w60 h60, 7
Gui, Add, Button, x+0 w60 h60, 8
Gui, Add, Button, x+0 w60 h60, 9
Gui, Add, Button, x+0 w60 h60, 0
Gui, Add, Button, x+0 w60 h60, [
Gui, Add, Button, x+0 w60 h60, ]
Gui, Add, Button, x+0 w120 h60, BACKSPACE

Gui, Add, Button, x0 w80 h60, tab
Gui, Add, Button, x+0 w60 h60, "
Gui, Add, Button, x+0 w60 h60, ,
Gui, Add, Button, x+0 w60 h60, .
Gui, Add, Button, x+0 w60 h60, P
Gui, Add, Button, x+0 w60 h60, Y
Gui, Add, Button, x+0 w60 h60, F
Gui, Add, Button, x+0 w60 h60, G
Gui, Add, Button, x+0 w60 h60, C
Gui, Add, Button, x+0 w60 h60, R
Gui, Add, Button, x+0 w60 h60, L
Gui, Add, Button, x+0 w60 h60, /
Gui, Add, Button, x+0 w60 h60, =
Gui, Add, Button, x+0 w100 h60, \

Gui, Add, Button, x0 w120 h60, CAPS LOCK
Gui, Add, Button, x+0 w60 h60, A
Gui, Add, Button, x+0 w60 h60, O
Gui, Add, Button, x+0 w60 h60, E
Gui, Add, Button, x+0 w60 h60, U
Gui, Add, Button, x+0 w60 h60, I
Gui, Add, Button, x+0 w60 h60, D
Gui, Add, Button, x+0 w60 h60, H
Gui, Add, Button, x+0 w60 h60, T
Gui, Add, Button, x+0 w60 h60, N
Gui, Add, Button, x+0 w60 h60, S
Gui, Add, Button, x+0 w60 h60, -
Gui, Add, Button, x+0 w120 h60, ENTER

Gui, Add, Button, x0 w140 h60, SHIFT
Gui, Add, Button, x+0 w60 h60,;
Gui, Add, Button, x+0 w60 h60, Q
Gui, Add, Button, x+0 w60 h60, J
Gui, Add, Button, x+0 w60 h60, K
Gui, Add, Button, x+0 w60 h60, X
Gui, Add, Button, x+0 w60 h60, B
Gui, Add, Button, x+0 w60 h60, M
Gui, Add, Button, x+0 w60 h60, W
Gui, Add, Button, x+0 w60 h60, V
Gui, Add, Button, x+0 w60 h60, Z
Gui, Add, Button, x+0 w160 h60, SHIFT

Gui, Add, Button, x0 w60 h60, CTRL
Gui, Add, Button, x+0 w60 h60, FN
Gui, Add, Button, x+0 w60 h60, WIN
Gui, Add, Button, x+0 w60 h60, ALT
Gui, Add, Button, x+0 w340 h60, SPACE
Gui, Add, Button, x+0 w60 h60, ALT
Gui, Add, Button, x+0 w60 h60, CTRL
Gui, Add, Button, x+0 w50 h60, <
Gui, Add, Button, x+0 w50 h60, v
Gui, Add, Button, x+0 w50 h60, ^
Gui, Add, Button, x+0 w50 h60, >

OnMessage(0x201,"WM_LBUTTONDOWN")

return


WM_LBUTTONDOWN(wParam,lParam,msg,hwnd){
    PostMessage, 0xA1, 2
  }

>!del::
showOverlay:=!showOverlay
If showOverlay{
    Gui, show,w1600 h900,  Test
    ; WinSet, Transparent, 150 , Test
}
else
	Gui, hide
return

if showOverlay
  gui, show, +NoActivate
else
  gui, hide

Return

esc::exitapp