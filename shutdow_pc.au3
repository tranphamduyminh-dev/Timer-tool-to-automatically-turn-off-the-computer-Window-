#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ### Form=
Global $Formmain = GUICreate("Turn off the computer | Tool", 346, 184, -1, -1)
GUISetIcon("C:\Users\h\Downloads\logo_-removebg-preview.ico", -1)
GUISetFont(14, 400, 0, "Segoe UI")
Global $Input_time = GUICtrlCreateInput("", 144, 24, 185, 33)
Global $Button_OK = GUICtrlCreateButton("OK", 144, 72, 185, 41, $BS_DEFPUSHBUTTON)
GUICtrlSetCursor(-1,0)
Global $Button_exit = GUICtrlCreateButton("Exit", 144, 128, 185, 25)
Global $Label_time = GUICtrlCreateLabel("Time (minutes)", 8, 28, 129, 29)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $time_minutes

While 1
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE
            Exit

        Case $Button_OK
            ; Đọc giá trị từ ô nhập khi người dùng nhấn OK
            $time_minutes = GUICtrlRead($Input_time)
			;kiểm tra giá trị nhập vào
			If $time_minutes <=0 Then
				MsgBox(48+262144,"Thông báo", "The value entered is invalid, please check again")
				ContinueLoop
			EndIf
			;kiểm tra thời gian hợp lệ
			If $time_minutes > 1440 Then
				MsgBox(48+262144,"Thông báo", "The input value is too large, please enter a value less than 1440")
				ContinueLoop
			EndIf
            ; Gọi hàm chuyển đổi
            Global $time_second = time_convert($time_minutes)
            Run('shutdown -f -s -t ' & $time_second)
			MsgBox(262144,"Thông báo","Schedule a successful shutdown of the computer")

        Case $Button_exit
            Exit
    EndSwitch
WEnd

; Hàm chuyển đổi thời gian (minute) thành thời gian (second)
Func time_convert($time_minutes)
    Return ($time_minutes * 60)
EndFunc
