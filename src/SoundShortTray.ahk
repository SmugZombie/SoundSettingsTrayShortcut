; Author: Ron Egli - gh.com/smugzombie
; Purpose: I needed a lazy way to access sound settings fast for switching profiles as needed

; Basic AHK Stuff
#SingleInstance force
#Persistent
#NoEnv

SetWorkingDir %A_ScriptDir%
APP_NAME = Audio Shortcut
VERSION = 1.0

Menu, Tray, NoStandard
Menu, Tray, Tip, %APP_NAME% - v%VERSION%
Menu, Tray, Icon, C:\Windows\System32\mmsys.cpl, 1

OnMessage(0x404, "AHK_NOTIFYICON")
AHK_NOTIFYICON(wParam, lParam, uMsg, hWnd)
{
	if (lParam = 0x201) ;WM_LBUTTONDOWN := 0x201
	{
		gosub OpenAudioSettings
	}
}

return

OpenAudioSettings:
Run, mmsys.cpl
return