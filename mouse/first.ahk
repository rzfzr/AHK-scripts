;from https://www.autohotkey.com/boards/viewtopic.php?t=24588&__cf_chl_captcha_tk__=62c2593e1bf245311f278c91d95a8a8acb2e2440-1620605975-0-AdHBAYrmOGEKgdk4haiarj3EYfsuhBeziDBLqIyP0NUzCod03RbgcDAmF4Wim8Hw-H6hLlG6nFSM-Gy5c34oiZGqM57sz9Z-E6pxXxMVU8ZNMqs6Zd7ty9U2BkboVp4jL6028HJK0PuvVHxu9-9YsT_uVy8sjZco_3KR5KvmmvzOwlOwDKuIUjEll9BZC4hOwzY47Q7NLmQIiSDmi8BZV7X4OXjb0K3pfyusLneseg4AUhBL_hH4LSGn27V9GnGzLKxDT1O1iVQbNNFmgcJZU-etmyIaD1GcyCGWj1fDW7_6gz81StPflVUfnUTwK1UrcNDwBqxpS3z_9LxQgviyd_u6F8lxDYA1yIMW9er9MxX3otBiPU95qi5yo0wmMSXZx-T1swPV57FZ6fD2xNilBzPyCG6N26TT7s32zKfT1t4XZiFmpWElI-k59KWfjQ3zx2f0DDKq7wI9YxBhAWVSRKipkprvfgQeO3PbZxlbH2kEL31lgKF6GvSS69stFlhsqlss3xdEH191CKYsIsOE1qJgf09z7Wmk_iKcd_hVCCSxuwULm9D7IYzuoxD5M86s6uLwDeUQRtsecg52ixIF3LDA6LtIBYmoaPTTszvO1Ey6YmsIKHrHJNMts-h_JeX48Z_r1oO4GDP7rbUc3bpJlgo

;The Offset variable controls pointer speed
;Ctrl + Arrow keys = move mouse
;Ctrl + comma = left click
;Ctrl + period = right click

#SingleInstance force

Offset = 25
fast = 3

>!,::MouseMove, 0, (Offset * -1), 0, R
>!o::MouseMove, 0, Offset, 0, R
>!a::MouseMove, (Offset * -1), 0, 0, R
>!e::MouseMove, Offset, 0, 0, R

>!<+,::MouseMove, 0, (Offset*fast * -1), 0, R
>!<+o::MouseMove, 0, Offset*fast, 0, R
>!<+a::MouseMove, (Offset*fast * -1), 0, 0, R
>!<+e::MouseMove, Offset*fast, 0, 0, R

>!Tab:: click WheelUp 
>!CapsLock:: click WheelDown

>!.::click right
>!<+'::click m
~>!'::Send, {Click} 

;This allows to press and hold the left mouse button instead of just clicking it once. Needed for drag and drop operations.
;snippet by x79animal at https://autohotkey.com/board/topic/59665-key-press-and-hold-emulates-mouse-click-and-hold-win7/
; ^,::
;    If (A_PriorHotKey = A_ThisHotKey)
;    return
; click down
; return
; ^, up::click up