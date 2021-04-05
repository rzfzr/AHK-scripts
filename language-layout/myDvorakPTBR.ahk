#SingleInstance force

Ralt & a::
Press(0195,0227)
Return

Ralt & o::
Press(0213,0245)
return

Ralt & e:: ;eh 
Press(144,130) 
Return


Ralt & c:: ;cedilha
Press(128,135)
Return

Press(a,b){ ; capital first
    if GetKeyState("Shift"){
        Send, {ASC %a%}
    }else{
        Send, {ASC %b%}
    }
    Return
}
