;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;                  RTSR MASM64: Real-Time Software Rendering in Microsoft Macro Assembler 64-bit                                    ;
;                                                                                                                                   ;
;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   -
; UpdateScene                                                                                                                       -
;                                                                                                                                   -
;------------------------------------------------------------------------------------------------------------------------------------
;                                                                                                                                   -
; In:  <No Parameters>                                                                                                              -
;                                                                                                                                   -
; This function updates the scene geometry and performes any other per-render updates required.                                     -
;                                                                                                                                   -
;------------------------------------------------------------------------------------------------------------------------------------

UpdateScene                                      proc                                                                               ; Declare function

;------[Local Data]------------------------------------------------------------------------------------------------------------------

                                                 local                      holder:qword                                            ;

;------[Save incoming registers]-----------------------------------------------------------------------------------------------------

                                                 Save_Registers                                                                     ; Save incoming registers

                                                 ;------[Increment position variable]------------------------------------------------
;                                                mov                        ecx, position.vector3.x
;                                                inc                        ecx
;                                                mov                        position.vector3.x, ecx
                                                 movss                      xmm0, position.vector3.x
                                                 addss                      xmm0, distance
                                                 movss                      position.vector3.x, xmm0

                                                 ;------[2d Projection]--------------------------------------------------------------
                                                 movss                      xmm0, mult
                                                 lea                        r8, tov_proj
                                                 lea                        rdx, tov
                                                 mov                        rcx, lentov
                                                 call                       projection

                                                 ;----[Multiply]--------------------------------------------------------------------------
                                                 lea                         rax, tov_proj
                                                 xor                         rcx, rcx                                                                

                                                 gridmult:
                                                 movss                       xmm0, [rax].vector2.x
                                                 addss                       xmm0, disp
                                                 movss                       [rax].vector2.x, xmm0
                                                 movss                       xmm0, [rax].vector2.y
                                                 addss                       xmm0, disp
                                                 movss                       [rax].vector2.y, xmm0

                                                 add                         rax, sizeof vector2
                                                 inc                         rcx
                                                 cmp                         rcx, lentov_proj
                                                 jl                          gridmult

                                                 ;------[----------------------------------------------------------------------------
                                                 ;------[----------------------------------------------------------------------------
                                                 ;------[----------------------------------------------------------------------------
                                                 ;------[----------------------------------------------------------------------------
                                                 ;------[----------------------------------------------------------------------------
                                                 ;------[----------------------------------------------------------------------------
                                                 ;------[----------------------------------------------------------------------------
                                                 ;------[----------------------------------------------------------------------------
                                                 ;------[----------------------------------------------------------------------------
                                                 ;------[----------------------------------------------------------------------------

;------[Restore incoming registers]--------------------------------------------------------------------------------------------------

                                                 align                      qword                                                   ; Set qword alignment
UpdateScene_Exit:                                Restore_Registers                                                                  ; Restore incoming registers

;------[Return to caller]------------------------------------------------------------------------------------------------------------

                                                 ret                                                                                ; Return to caller

UpdateScene                                      endp                                                                               ; End function




;----------------------------------------------------------------------------------------------------------------------------------------
;                                                                                                                                       ;
; RenderScene                                                                                                                           ;
;                                                                                                                                       ;
;----------------------------------------------------------------------------------------------------------------------------------------
;                                                                                                                                       ;
; In:  <No Parameters>                                                                                                                  ;
;                                                                                                                                       ;
;                                                                                                                                       ;
;----------------------------------------------------------------------------------------------------------------------------------------
                                                option casemap: none
RenderScene                                     proc                                                                                    ; Declare function

;------[Local Data]----------------------------------------------------------------------------------------------------------------------

                                                local                       holder:qword                                                ;

;------[Save incoming registers]---------------------------------------------------------------------------------------------------------

                                                Save_Registers                                                                          ; Save incoming registers

                                                ;----[Draw Pixel]------------------------------------------------------------------------
;                                               mov                       r9d, 00FF0000h                                                ; color
;                                               lea                       r8, render_frame                                              ; framebuffer address
;                                               mov                       edx, 32                                                       ; y
;                                               mov                       ecx, 32                                                       ; x
;                                               call                      drawPixel

                                                ;----[Draw Line]-------------------------------------------------------------------------
;                                               mov                       r11, 128                                                      ; width
;                                               mov                       r9, 0000FFFFh                                                 ; color
;                                               lea                       r8, render_frame                                              ; framebuffer address
;                                               mov                       rdx, 128                                                      ; y
;                                               mov                       ecx, 64                                                       ; x
;                                               call                      drawLine

                                                ;----[Fill Background]-------------------------------------------------------------------
                                                mov                         r9d, 00222222h                                              ; color
                                                lea                         r8, render_frame                                            ; framebuffer address
                                                call                        fillBackground

                                                ;----[Draw Rect]-------------------------------------------------------------------------
                                                mov                         r12d, 32                                                    ; h
                                                mov                         r11d, 32                                                    ; w
                                                mov                         r9d, 0000FF00h                                              ; color
                                                lea                         r8, render_frame                                            ; framebuffer address
                                                mov                         edx, 64                                                     ; y
                                                cvttss2si                   ecx, position.vector3.x
;                                               mov                         ecx, position.vector3.x                                     ; x
                                                call                        drawRect

                                                ;----[Draw Grid Vectors]-----------------------------------------------------------------
                                                lea                         rax, tov_proj
                                                xor                         rcx, rcx                                                                

                                                drawgrid:
                                                push                        rcx
                                                push                        rax
                                                mov                         r12d, 4                                                     ; h
                                                mov                         r11d, 4                                                     ; w
                                                mov                         r9d, 000000FFh                                              ; color
                                                lea                         r8, render_frame                                            ; framebuffer address
                                                cvttss2si                   edx, [rax].vector2.x
                                                cvttss2si                   ecx, [rax].vector2.y
                                                call                        drawRect
                                                pop                         rax
                                                pop                         rcx

                                                add                         rax, sizeof vector3
                                                inc                         rcx
                                                cmp                         rcx, lentov
                                                jl                          drawgrid

                                                ;-----[Update Frame Buffer]--------------------------------------------------------------
                                                xor                         r8, r8
                                                xor                         rdx, rdx
                                                mov                         rcx, Main_Handle
                                                WinCall                     InvalidateRect, rcx, rdx, r8

                                                mov                         rcx, Main_Handle
                                                WinCall                     UpdateWindow, rcx

                                                ;-----[Zero final return]----------------------------------------------------------------
                                                xor                 rax, rax                                                            ; Zero final return

;------[Restore incoming registers]------------------------------------------------------------------------------------------------------

                                                align                       qword                                                       ; Set qword alignment
RenderScene_Exit:                               Restore_Registers                                                                       ; Restore incoming registers

;------[Return to caller]----------------------------------------------------------------------------------------------------------------

                                                ret                                                                                     ; Return to caller

RenderScene                                     endp                                                                                    ; End function



;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; RunMessageLoop                                                                                                       -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; In:  <No Parameters>                                                                                                 -
;                                                                                                                      -
; This function registers the window class MainWindowClass, creates the main window as a top level window of that      -
; class, and returns the new window handle in RAX.  RAX is returned as -1 if the function fails.                       -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------

RunMessageLoop                                  proc                                                                   ; Declare function

;------[Local Data]-----------------------------------------------------------------------------------------------------

                                                local               holder:qword                                      
                                                local               msg_data:msg                                     

;------[Save incoming registers]----------------------------------------------------------------------------------------

                                                Save_Registers                                                         ; Save incoming registers

                                                ;-----[Get the next message]-------------------------------------------

RunMessageLoop_00001:                           xor                 r9, r9                                             ; Set wMsgFilterMax
                                                xor                 r8, r8                                             ; Set wMsgFilterMin
                                                xor                 rdx, rdx                                           ; Set hWnd
                                                lea                 rcx, msg_data                                      ; Set lpMsg
                                                WinCall             PeekMessage, rcx, rdx, r8, r9, pm_remove           ; Peek for next message

                                                ;-----[Branch if no messages]------------------------------------------

                                                test                rax, rax                                           ; Anything available?
                                                jz                  RunMessageLoop_00003                               ; No - render scene

                                                ;-----[Branch if not WM_Quit]------------------------------------------

                                                cmp                 msg_data.message, wm_quit                          ; WM_Quit?
                                                jnz                 RunMessageLoop_00002                               ; No - continue process

                                                ;-----[Send the message manually]--------------------------------------

                                                xor                 r9, r9                                             ; Set lParam
                                                xor                 r8, r8                                             ; Set wParam
                                                mov                 rdx, wm_quit                                       ; Set uMsg
                                                mov                 rcx, Main_Handle                                   ; Set hWnd
                                                WinCall             SendMessage, rcx, rdx, r8, r9                      ; Execute call

                                                ;-----[Exit the function]----------------------------------------------

                                                xor                 rax, rax                                           ; Zero final return
                                                jmp                 RunMessageLoop_Exit                                ; Exit function

                                                ;-----[Translate the message]------------------------------------------

RunMessageLoop_00002:                           lea                 rcx, msg_data                                      ; Set lpMsg
                                                WinCall             TranslateMessage, rcx                              ; Execute call

                                                ;-----[Dispatch the message]-------------------------------------------

                                                lea                 rcx, msg_data                                      ; Set lpMsg
                                                WinCall             DispatchMessage, rcx                               ; Execute call

                                                ;-----[Check for next message]-----------------------------------------

                                                jmp                 RunMessageLoop_00001                               ; Reloop for next check


RunMessageLoop_00003:                           
                                                ;-----[Process input]--------------------------------------------------
;                                               LocalCall           ProcessInput                                       ; Process user input

                                                ;-----[Update the scene]-----------------------------------------------
                                                LocalCall           UpdateScene                                        ; Update the scene

                                                ;-----[Render the scene]-----------------------------------------------
                                                LocalCall           RenderScene                                        ; Render the scene

                                                ;-----[Check for next message]-----------------------------------------

                                                jmp                 RunMessageLoop_00001                              ; Reloop for next check

;------[Restore incoming                         registers]-------------------------------------------------------------------------------------

                                                align               qword                                             ; Set qword alignment
RunMessageLoop_Exit:                            Restore_Registers                                                     ; Restore incoming registers

;------[Return to caller                        ]-----------------------------------------------------------------------------------------------

                                                ret                                                                   ; Return to caller

RunMessageLoop                                  endp                                                                  ; End function




;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; SetupMainWindow                                                                                                      -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; In:  <No Parameters>                                                                                                 -
;                                                                                                                      -
; This function registers the window class MainWindowClass, creates the main window as a top level window of that      -
; class, and returns the new window handle in RAX.  RAX is returned as -1 if the function fails.                       -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------

SetupMainWindow                                 proc                                                                                    ; Declare function

;------[Local Data]-----------------------------------------------------------------------------------------------------

                                                local               holder:qword                                                        ;

;------[Save incoming registers]----------------------------------------------------------------------------------------

                                                Save_Registers                                                                          ; Save incoming registers

                                                ;----[Setup Grid]------------------------------------------------------------------------
                                                call                gengrid

                                                xor                 rcx, rcx                                                            ; The first parameter (NULL) always goes into RCX
                                                WinCall             GetModuleHandle, rcx                                                ; 1 parameter is passed to this function
                                                mov                 hInstance, rax                                                      ; RAX always holds the return value when calling Win32 functions

                                                WinCall             GetCommandLine                                                      ; No parameters on this call
                                                mov                 r8, rax                                                             ; Save the command line string pointer

                                                lea                 rcx, startup_info                                                   ; Set lpStartupInfo
                                                WinCall             GetStartupInfo, rcx                                                 ; Get the startup info
                                                xor                 r9, r9                                                              ; Zero all bits of RAX
                                                mov                 r9w, startup_info.wShowWindow                                       ; Get the incoming nCmdShow
                                                xor                 rdx, rdx                                                            ; Zero RDX for hPrevInst
                                                mov                 rcx, hInstance                                                      ; Set hInstance

; RCX, RDX, R8, and R9 are now set exactly as they would be on entry to the WinMain function.  WinMain is not
; used, so the code after this point proceeds exactly as it would inside WinMain.

                                                ;-----[Load cursor image]----------------------------------------------
                                                ; xor                 r11, r11                                ; Set cyDesired; uses default if zero: XOR R11 with itself zeroes the register
                                                ; xor                 r9, r9                                  ; Set cxDesired; uses default if zero: XOR R9 with itself zeroes the register
                                                ; mov                 r8, image_cursor                        ; Set uType
                                                ; mov                 rdx, ocr_normal                         ; Set lpszName
                                                ; xor                 rcx, rcx                                ; Set hInstance
                                                ; WinCall         LoadImage, 6, rcx, rdx, r8, r9, r11, lr_cur ; Load the standard cursor
                                                ; mov                 wcl.hCursor, rax                        ; Set wcl.hCursor

                                                ;-----[Load the large icon]--------------------------------------------
                                                ; mov                 r11, 32                                 ; Set cyDesited
                                                ; mov                 r9, 32                                  ; Set cxDesired
                                                ; mov                 r8, image_icon                          ; Set uType
                                                ; lea                 rdx, LargeIconResource                  ; Set lpszName
                                                ; mov                 rcx, hInstance                          ; Set hInstance
                                                ; WinCall         LoadImage, 6, rcx, rdx, r8, r9, r11, lr_cur ; Load the large icon
                                                ; mov                 wcl.hIcon, rax                          ; Set wcl.hIcon

                                                ;----[Load the small icon]---------------------------------------------
                                                ; mov                 r11, 32                                 ; Set cyDesited
                                                ; mov                 r9, 32                                  ; Set cxDesired
                                                ; mov                 r8, image_icon                          ; Set uType
                                                ; lea                 rdx, SmallIconResource                  ; Set lpszName
                                                ; mov                 rcx, hInstance                          ; Set hInstance
                                                ; WinCall         LoadImage, 6, rcx, rdx, r8, r9, r11, lr_cur ; Load the large icon
                                                ; mov                 wcl.hIconSm, rax                        ; Set wcl.hIcon

                                                ;----[Register the window class]---------------------------------------
                                                lea                 rcx, wcl                                    ; Set lpWndClass
                                                WinCall             RegisterClassEx, rcx                        ; Register the window class

                                                ;----[Create Compat DC]------------------------------------------------
                                                xor                 rcx, rcx
                                                WinCall             CreateCompatibleDC, rcx
                                                mov                 frame_device_context, rax                       

                                                ;----[Create the main window]------------------------------------------
                                                xor                 r15, r15                                    ; Set hWndParent
                                                mov                 r14, 480                                    ; Set nHeight
                                                mov                 r13, 640                                    ; Set nWidth
                                                mov                 r12, 100                                    ; Set y
                                                mov                 r11, 100                                    ; Set x
                                                mov                 r9, mw_style                                ; Set dwStyle
                                                ; mov                 r9, 0                                     ; Set dwStyle
                                                lea                 r8, mainName                                ; Set lpWindowName
                                                lea                 rdx, mainClass                              ; Set lpClassName
                                                xor                 rcx, rcx                                    ; Set dwExStyle
                                                WinCall             CreateWindowEx, rcx, rdx, r8, r9, r11, r12, r13, r14, r15, 0, hInstance, 0
                                                mov                 Main_Handle, rax                            ; Save the main window handle

                                                ;----[Ensure main window displayed and updated]------------------------
                                                mov                 rdx, sw_show                                ; Set nCmdShow
                                                mov                 rcx, rax                                    ; Set hWnd
                                                WinCall             ShowWindow, rcx, rdx                        ; Display the window
;                                               mov                 rax, r15                                    ; Reset the return value

                                                mov                 rcx, Main_Handle                            ; Set hWnd
                                                WinCall             UpdateWindow, rcx                           ; Ensure window updated

;------[Restore incoming registers]-------------------------------------------------------------------------------------

                                                align               qword                                             ; Set qword alignment
SetupMainWindow_Exit:                           Restore_Registers                                                     ; Restore incoming registers

;------[Return to caller]-----------------------------------------------------------------------------------------------

                                                ret                                                                   ; Return to caller

SetupMainWindow                                 endp                                                                  ; End function



;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; Shutdown                                                                                                             -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; In:  <No Parameters>                                                                                                 -
;                                                                                                                      -
; This function closes out everything that was opened including DirectX, Windows stuff, all of it.                     -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------

Shutdown                                        proc                                                                  ; Declare function
;------[Local Data]-----------------------------------------------------------------------------------------------------

                                                local               holder:qword                                      ;

;------[Save incoming registers]----------------------------------------------------------------------------------------

                                                Save_Registers                                                        ; Save incoming registers

                                                ;------[Unregister the main window class]------------------------------

                                                mov                 rdx, hInstance                                    ; Set hInstance
                                                lea                 rcx, mainClass                                    ; Set lpClassName
                                                WinCall             UnregisterClass, rcx, rdx                         ; Execute call

;------[Restore incoming registers]-------------------------------------------------------------------------------------

                                                align               qword                                             ; Set qword alignment
Shutdown_Exit:                                  Restore_Registers                                                     ; Restore incoming registers

;------[Return to caller]-----------------------------------------------------------------------------------------------

                                                ret                                                                   ; Return to caller

Shutdown                                        endp                                                                  ; End function



