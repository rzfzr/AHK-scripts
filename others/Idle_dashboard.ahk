#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance force
#Persistent

SetTimer, Check, 5000
return
Check:
    If (A_TimeIdle > 35000){
        NextTab()
        CheckPower() 
        HandleMouse()
    }
return

NextTab(){
    send, {F5}
    sleep 250
    send, ^%A_Tab%
    sleep 250
return
}

HandleMouse(){ 
    ; MouseGetPos, xpos, ypos 
    ; if((%xpos%!=640) || (%ypos%!=400)){
    MouseMove, 640,400
    ; }
return
}

CheckPower(){ 
    VarSetCapacity(powerstatus, 1+1+1+1+4+4)
    success := DllCall("kernel32.dll\GetSystemPowerStatus", "uint", &powerstatus)
    acLineStatus:=ReadInteger(&powerstatus,0,1,false)
    if(%acLineStatus%=0){
        sleep 250
        send, #x
        sleep 250
        send, u
        sleep 250
        send, s
    }
return
}

ReadInteger( p_address, p_offset, p_size, p_hex=true ) {
    value = 0
    old_FormatInteger := a_FormatInteger
    if ( p_hex )
        SetFormat, integer, hex
    else
        SetFormat, integer, dec
    loop, %p_size%
        value := value+( *( ( p_address+p_offset )+( a_Index-1 ) ) << ( 8* ( a_Index-1 ) ) )
    SetFormat, integer, %old_FormatInteger%
return, value
}