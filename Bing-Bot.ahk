Sleep, 300
MsgBox, "Ctrl+I" to start, "Ctrl+O" to kill script. You can also right click the green H in the bottom right and click on "Exit". 

Sleep, 300
MsgBox, When this script is running, make sure not to click on anything.

Sleep, 300
MsgBox, Make sure you have Edge browser installed.

Sleep, 300
MsgBox, Ready for execution!

^i::

SearchCounter = 0

FailureCounter = 0

run msedge.exe, , Max UseErrorLevel ; Runs Microsoft Edge

if ErrorLevel = ERROR ; Runs a check for whether or not you installed Microsoft Edge.
{
	MsgBox, Microsoft Edge is not installed! Please install Microsoft Edge for this script to work. Script will now close.
	ExitApp
}

Sleep, 1000
MsgBox, Click "OK" to confirm that Edge is fully loaded.

Random, SearchValue, 1000, 9999 ; Generates random number from 1000 to 9999.
	
Send, ^l
Sleep, 50

Send, https://www.bing.com/search?q=%SearchValue%
Sleep, 100

Send, {Enter}
SearchCounter += 1
Sleep, 1500

MouseGetPos, MouseX, MouseY

Tooltip, %SearchCounter% out of 30., %MouseX%, %MouseY%
	
PixelSearch, CheckX, CheckY, 0, 100, 300, 250, 0x3ec58d, 0, Fast

Loop, 29
{
	Send, ^l
	Sleep, 50
	
	Random, SearchValue, 1000, 9999 ; Generates random number from 1000 to 9999.
	
	Send, https://www.bing.com/search?q=%SearchValue%
	Sleep, 100
	
	Send, {Enter}
	SearchCounter += 1
	Sleep, 1500
	
	MouseGetPos, MouseX, MouseY

	Tooltip, %SearchCounter% out of 30., %MouseX%, %MouseY%
	
	PixelSearch, NewX, CheckY, 0, 100, 300, 250, 0x3ec58d, 0, Fast
	
	While NewX != CheckX
	{
		Sleep, 500
		
		FailureCounter += 1
		
		if FailureCounter = 5
		{
			MsgBox, Something went wrong, ping ShatteredEdgeith#0478 and send screenshot of edge page. Now killing script.
			ExitApp
		}
		
	}
}
	
Sleep, 300
MsgBox, End of loop, you can redo the hotkey if you wish, but you can press "Ctrl+O" to exit the program.
return

^o::
ExitApp
return
