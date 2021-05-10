OnMessage(0x404, "AHK_NOTIFYICON")
AHK_NOTIFYICON(wParam, lParam, uMsg, hWnd)
{
	static vCount
	if (lParam = 0x200) ;WM_MOUSEMOVE := 0x200
		return
	vCount++
	;DetectHiddenWindows, On
	;WinGetClass, vWinClass, % "ahk_id " hWnd
	;MsgBox, % hWnd "`r`n" (A_ScriptHwnd+0) "`r`n" vWinClass
	ToolTip, % Format("{}`r`n{} {} {} {}", vCount, wParam, lParam, uMsg, hWnd)
}