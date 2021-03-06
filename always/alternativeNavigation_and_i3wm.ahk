#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Globals
DesktopCount = 2 ; Windows starts with 2 desktops at boot
CurrentDesktop = 1 ; Desktop count is 1-indexed (Microsoft numbers them this way)

mapDesktopsFromRegistry()
{
    global CurrentDesktop, DesktopCount
    ; Get the current desktop UUID. Length should be 32 always, but there's no guarantee this couldn't change in a later Windows release so we check.
    IdLength := 32
    SessionId := getSessionId()
    if (SessionId) {
        RegRead, CurrentDesktopId, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\%SessionId%\VirtualDesktops, CurrentVirtualDesktop
        if (CurrentDesktopId) {
            IdLength := StrLen(CurrentDesktopId)
        }
    }
    ; Get a list of the UUIDs for all virtual desktops on the system
    RegRead, DesktopList, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs
    if (DesktopList) {
        DesktopListLength := StrLen(DesktopList)
        ; Figure out how many virtual desktops there are
        DesktopCount := DesktopListLength / IdLength
    } else {
        DesktopCount := 1
    }
    ; Parse the REG_DATA string that stores the array of UUID's for virtual desktops in the registry.
    i := 0
    while (CurrentDesktopId and i < DesktopCount) {
        StartPos := (i * IdLength) + 1
        DesktopIter := SubStr(DesktopList, StartPos, IdLength)
        OutputDebug, The iterator is pointing at %DesktopIter% and count is %i%.
        ; Break out if we find a match in the list. If we didn't find anything, keep the
        ; old guess and pray we're still correct :-D.
        if (DesktopIter = CurrentDesktopId) {
            CurrentDesktop := i + 1
            OutputDebug, Current desktop number is %CurrentDesktop% with an ID of %DesktopIter%.
            break
        }
        i++
    }
}
;
; This functions finds out ID of current session.
;
getSessionId()
{
    ProcessId := DllCall("GetCurrentProcessId", "UInt")
    if ErrorLevel {
        OutputDebug, Error getting current process id: %ErrorLevel%
        return
    }
    OutputDebug, Current Process Id: %ProcessId%
    DllCall("ProcessIdToSessionId", "UInt", ProcessId, "UInt*", SessionId)
    if ErrorLevel {
        OutputDebug, Error getting session id: %ErrorLevel%
        return
    }
    OutputDebug, Current Session Id: %SessionId%
    return SessionId
}
;
; This function switches to the desktop number provided.
;
switchDesktopByNumber(targetDesktop)
{
    global CurrentDesktop, DesktopCount
    ; Re-generate the list of desktops and where we fit in that. We do this because
    ; the user may have switched desktops via some other means than the script.
    mapDesktopsFromRegistry()
    ; Don't attempt to switch to an invalid desktop
    if (targetDesktop > DesktopCount || targetDesktop < 1) {
        OutputDebug, [invalid] target: %targetDesktop% current: %CurrentDesktop%
        return
    }
    ; Go right until we reach the desktop we want
    while (CurrentDesktop < targetDesktop) {
        Send ^#{Right}
        CurrentDesktop++
        OutputDebug, [right] target: %targetDesktop% current: %CurrentDesktop%
    }
    ; Go left until we reach the desktop we want
    while (CurrentDesktop > targetDesktop) {
        Send ^#{Left}
        CurrentDesktop--
        OutputDebug, [left] target: %targetDesktop% current: %CurrentDesktop%
    }
}
;
; This function creates a new virtual desktop and switches to it
;
createVirtualDesktop()
{
    global CurrentDesktop, DesktopCount
    Send, #^d
    DesktopCount++
    CurrentDesktop = %DesktopCount%
    OutputDebug, [create] desktops: %DesktopCount% current: %CurrentDesktop%
}
;
; This function deletes the current virtual desktop
;
deleteVirtualDesktop()
{
    global CurrentDesktop, DesktopCount
    Send, #^{F4}
    DesktopCount--
    CurrentDesktop--
    OutputDebug, [delete] desktops: %DesktopCount% current: %CurrentDesktop%
}
; Main
SetKeyDelay, 75
mapDesktopsFromRegistry()
OutputDebug, [loading] desktops: %DesktopCount% current: %CurrentDesktop%
LWin & f1::switchDesktopByNumber(1)
LWin & f2::switchDesktopByNumber(2)
LWin & f3::switchDesktopByNumber(3)
LWin & f4::switchDesktopByNumber(4)
LWin & f5::switchDesktopByNumber(5)
LWin & f6::switchDesktopByNumber(6)
LWin & f7::switchDesktopByNumber(7)
LWin & f8::switchDesktopByNumber(8)
LWin & f9::switchDesktopByNumber(9)

; copy and paste
; <!q::
;     Send ^x
; return

; <!j::
;     Send ^c
; return

; <!k::
;     Send ^v
; return

; page up and down
>!g::Send {PgUp} ; Page Up
>!r::Send {PgDn} ; Page Down

; only left alt
>!h::Send {Left} ; Arrow Left
>!c::Send {Up} ; Arrow Up
>!t::Send {Down} ; Arrow Down
>!n::Send {Right} ; Arrow Right
; ctrl
^>!h::Send ^{Left} ; Ctrl Arrow Left
^>!c::Send ^{Up} ; Ctrl Arrow Up
^>!t::Send ^{Down} ; Ctrl Arrow Down
^>!n::Send ^{Right} ; Ctrl Arrow Right
; ctrl+shift
+^>!h::Send +^{Left} ; Ctrl+Shift Arrow Left
    +^>!c::Send +^{Up} ; Ctrl+Shift Arrow Up
+^>!t::Send +^{Down} ; Ctrl+Shift Arrow Down
    +^>!n::Send +^{Right} ; Ctrl+Shift Arrow Right
; shift
+>!h::Send +{Left} ; Shift Arrow Left
    +>!c::Send +{Up} ; Shift Arrow Up
+>!t::Send +{Down} ; Shift Arrow Down
    +>!n::Send +{Right} ; Shift Arrow Right
; both alts
<!>!h::Send !{Left} ; Alt Arrow Left
<!>!c::Send !{Up} ; Alt Arrow Up
<!>!t::Send !{Down} ; Alt Arrow Down
<!>!n::Send !{Right} ; Alt Arrow Right
