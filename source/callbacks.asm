
;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; Main_CB                                                                                                              -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; In:  rcx = hWnd                                                                                                      -
;      rdx = uMsg                                                                                                      -
;      r8  = wParam                                                                                                    -
;      r9  = lParam                                                                                                    -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------

                                                option              casemap:none
Main_CB                                         proc                                                                  ; Declare function

;-----[Local Data]-----------------------------------------------------------------------------------------------------

                                                local               holder:qword                                      ; local variable for WinCall macro
                                                local               hWnd:qword                                        ; window handle
                                                local               lParam:qword                                      ; lParam
                                                local               message:qword                                     ; message
                                                local               wParam:qword                                      ; wParam

;-----[Save incoming registers]----------------------------------------------------------------------------------------

                                                Save_Registers                                                        ; Save incoming registers

                                                ;-----[Set incoming values]-------------------------------------------

                                                mov                 hWnd, rcx                                         ; Set the incoming handle
                                                mov                 message, rdx                                      ; Set the incoming message
                                                mov                 wParam, r8                                        ; Set the incoming wParam value
                                                mov                 lParam, r9                                        ; Set the incoming lParam value

                                                                   

                                                ;-----[Branch if overriding local callouts]---------------------------

                                                cmp                 in_shutdown, 0                                    ; In shutdown process?
                                                jnz                 Main_CB_00001                                     ; Yes -- default handling only

                                                ;-----[Lookup incoming message]---------------------------------------

                                                mov                 rcx, rdx                                          ; Set message
                                                lea                 rdx, Main_CB_Lookup                               ; Set lpLookupList
                                                LocalCall           Common_Lookup                                     ; Route for incoming message

                                                ;-----[Branch if message lookup hit]-----------------------------------
                                                ;
                                                ; If the incoming uMsg value is present in the Main_CB_Lookup list, the
                                                ; return value for RAX will contain the 0-based qword index of the list
                                                ; item matched.  If no match, -1 is returned.

                                                cmp                 rax, -1                                           ; Message lookup hit?
                                                jnz                 Main_CB_00002                                     ; Yes -- route for message

                                                ;-----[Execute default handler]---------------------------------------

Main_CB_00001:                                  mov                 rcx, hWnd                                         ; Reset RCX
                                                mov                 rdx, message                                      ; Reset RDX
                                                mov                 r8, wParam                                        ; Reset R8
                                                mov                 r9, lParam                                        ; Reset R9
                                                WinCall             DefWindowProc, rcx, rdx, r8, r9                   ; Execute call
                                                jmp                 Main_CB_Exit                                      ; Exit procedure

                                                ;-----[Route for target message]--------------------------------------

Main_CB_00002:                                  shl                 rax, 3                                            ; Scale to * 8 for byte offset
                                                LocalCall           Main_CB_Rte [ rax ]                               ; Execute target callout

;-----[Restore incoming registers]-------------------------------------------------------------------------------------

                                                align               qword                                             ; Set qword alignment
Main_CB_Exit:                                   Restore_Registers                                                     ; Restore incoming registers

;-----[Return to caller]-----------------------------------------------------------------------------------------------

                                                ret                                                                   ; Return to caller

;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; Handler: WM_EraseBkgnd message.                                                                                      -
;                                                                                                                      -
;          Since DirectX handles drawing, this handler does nothing but return TRUE to say "processed."                -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------

                                                align               qword                                             ; Set qword alignment
Main_CB_EraseBkgnd                              label               qword                                             ; Declare label

                                                ;-----[Set TRUE return]-----------------------------------------------

                                                ; mov                 rax, 1                                            ; Set TRUE return

                                                ;-----[Return to caller]-----------------------------------------------

                                                byte                0C3h                                              ; Encoded RET statement

;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; Handler: WM_Paint message.                                                                                           -
;                                                                                                                      -
;          Since DirectX handles drawing, this handler only validates the invalid client area to prevent WM_Paint      -
;          from being sent over and over.                                                                              -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------

                                                align               qword                                             ; Set qword alignment
Main_CB_Paint                                   label               qword                                             ; Declare label

                                                ;-----[Configure device context]--------------------------------------

                                                lea                rdx, paint
                                                mov                rcx, hWnd
                                                WinCall            BeginPaint, rcx, rdx
                                                mov                device_context, rax

                                                ;-----[Bit-Blitting]--------------------------------------------------

                                                xor                 r15, 00CC0020h                                     ; rop(SRCCOPY)
                                                mov                 r14, 0                                             ; y1
                                                mov                 r13, 0                                             ; x1
                                                mov                 r12, frame_device_context                          ; hdcSrc
                                                mov                 r11, 480                                           ; cy
                                                mov                 r9, 640                                            ; cx
                                                mov                 r8, 0                                              ; y   ; paint.rcPaint.top
                                                mov                 rdx, 0                                             ; x   ; qword ptr [paint.rcPaint.left]
                                                mov                 rcx, device_context                                ; hdc
                                                WinCall             BitBlt, rcx, rdx, r8, r9, r11, r12, r13, r14, r15

                                                ;-----[End Paint]------------------------------------------------------

                                                lea                 rdx, paint                                        
                                                mov                 rcx, hWnd                                         
                                                WinCall             EndPaint, rcx, rdx

                                                ;-----[Return to caller]-----------------------------------------------

                                                byte                0C3h                                              ; Encoded RET statement

;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; Handler: WM_Size message.                                                                                            -
;                                                                                                                      -
;          Since DirectX handles drawing, this handler only validates the invalid client area to prevent WM_Paint      -
;          from being sent over and over.                                                                              -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------

                                                align               qword                                             ; Set qword alignment
Main_CB_Size                                    label               qword                                             ; Declare label

                                                ;-----[Validate the invalid rectangle]--------------------------------
                                                xor                rcx, rcx
                                                xor                rdx, rdx

                                                ;                   frame_bitmap_info.bmiHeader.biHeight <- msg.lParam
                                                mov                 rcx, lParam
                                                and                 rcx, 00000FFFFh
                                                lea                 rdx, frame_bitmap_info.bmiHeader.biWidth
                                                mov                 word ptr [rdx], cx

                                                ;                   frame_bitmap_info.bmiHeader.biWidth <- msg.lParam
                                                mov                 rcx, lParam
                                                and                 rcx, 0FFFF0000h
                                                shr                 rcx, 4 * 4
                                                lea                 rdx, frame_bitmap_info.bmiHeader.biHeight
                                                mov                 word ptr [rdx], cx

                                                mov                 rcx, frame_bitmap
                                                cmp                 rcx, 0
                                                jz                  isNull
                                                WinCall             DeleteObject, rcx
                        isNull:
                                                xor                 r12, r12                                            ;
                                                xor                 r11, r11                                            ;
                                                lea                 r9, render_frame.rfPixels                           ;
                                                xor                 r8, r8                                              ; DIB_RGB_COLORS 
                                                lea                 rdx, frame_bitmap_info                              ;
                                                xor                 rcx, rcx                                            ;
                                                WinCall             CreateDIBSection, rcx, rdx, r8, r9, r11, r12
                                                mov                 frame_bitmap, rax

                                                mov                 rdx, frame_bitmap
                                                mov                 rcx, frame_device_context
                                                WinCall             SelectObject, rcx, rdx

                                                ;                   render_frame.rfWidth <- msg.lParam
                                                xor                 rcx, rcx
                                                xor                 rdx, rdx

                                                mov                 rcx, lParam
                                                and                 rcx, 00000FFFFh
                                                lea                 rdx, render_frame.rfWidth
                                                mov                 word ptr [rdx], cx

                                                ;                   render_frame.rfHeight <- msg.lParam
                                                mov                 rcx, lParam
                                                and                 rcx, 0FFFF0000h
                                                shr                 rcx, 4 * 4
                                                lea                 rdx, render_frame.rfHeight
                                                mov                 word ptr [rdx], cx

                                                ;-----[Return to caller]-----------------------------------------------

                                                byte                0C3h                                              ; Encoded RET statement

;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; Handler: WM_Close message.                                                                                           -
;                                                                                                                      -
;          Execute DirectX shutdowns and destroy main window.                                                          -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------

                                                align               qword                                             ; Set qword alignment
Main_CB_Close                                   label               qword                                             ; Declare label

                                                ;-----[Do DirectX cleanups]--------------------------------------------

                                                LocalCall           Shutdown                                          ; Shut down DirectX

                                                ;-----[Destroy the main window]----------------------------------------

                                                mov                 rcx, Main_Handle                                  ; Set hWnd
                                                WinCall             DestroyWindow, rcx                                ; Execute call

                                                ;-----[Set ZERO return]------------------------------------------------

                                                xor                 rax, rax                                          ; Set ZERO return

                                                ;-----[Return to caller]-----------------------------------------------

                                                byte                0C3h                                              ; Encoded RET statement

;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; Handler: WM_Destroy message.                                                                                         -
;                                                                                                                      -
;          Post WM_Quit.                                                                                               -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------

                                                align               qword                                             ; Set qword alignment
Main_CB_Destroy                                 label               qword                                             ; Declare label

                                                ;-----[Post the quit message]------------------------------------------

                                                xor                 rax, rax                                          ; Set nExitCode
                                                WinCall             PostQuitMessage, rcx                              ; Post the quit message

                                                ;-----[Set ZERO return]------------------------------------------------

                                                xor                 rax, rax                                          ; Set ZERO return

                                                ;-----[Return to caller]-----------------------------------------------

                                                byte                0C3h                                              ; Encoded RET statement

Main_CB                                         endp                                                                  ; End function
