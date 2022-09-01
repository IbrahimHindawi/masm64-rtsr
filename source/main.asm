;___________________________________________________________________________________________________________________
;
;                  RTSR MASM64: Real-Time Software Rendering in Microsoft Macro Assembler 64-bit
;
;__________________[Windows]________________________________________________________________________________________
                    include             macros.asm                              ;
                    include             structuredefs.asm                       ;
                    include             wincons.asm                             ;

                    .data                                                       ;
                    include             lookups.asm                             ;
                    include             riid.asm                                ;
                    include             routers.asm                             ; lookup routers
                    include             diagnostics.asm                         ; router decl

                    .code                                                       ;
                    include             externals.asm                           ; external proc defs
                    include             callbacks.asm                           ; callbacks
                    include             common.asm                              ; lookups

;__________________[Program]________________________________________________________________________________________
                    .const
                    include             constants.asm                           ;

                    .data
                    include             structures.asm                          ;
                    include             buffers.asm                             ;
                    include             strings.asm                             ;
                    include             variables.asm                           ; 

                    .code
                    include             general.asm                             ; main app logic
                    include             renderprocs.asm                         ; rendering logic

                    option              casemap:none
main                proc                                                        ; Declare the startup function; this is declared as /entry in the linker command line

                    local               holder:qword                            ; Required for the WinCall macro

                    xor                 rcx, rcx                                ; The first parameter (NULL) always goes into RCX
                    WinCall             GetModuleHandle, rcx                 ; 1 parameter is passed to this function
                    mov                 hInstance, rax                          ; RAX always holds the return value when calling Win32 functions

                    WinCall             GetCommandLine                       ; No parameters on this call
                    mov                 r8, rax                                 ; Save the command line string pointer

                    lea                 rcx, startup_info                       ; Set lpStartupInfo
                    WinCall             GetStartupInfo, rcx                  ; Get the startup info
                    xor                 r9, r9                                  ; Zero all bits of RAX
                    mov                 r9w, startup_info.wShowWindow           ; Get the incoming nCmdShow
                    xor                 rdx, rdx                                ; Zero RDX for hPrevInst
                    mov                 rcx, hInstance                          ; Set hInstance

; RCX, RDX, R8, and R9 are now set exactly as they would be on entry to the WinMain function.  WinMain is not
; used, so the code after this point proceeds exactly as it would inside WinMain.

; Load the cursor image

                    ; xor                 r11, r11                                ; Set cyDesired; uses default if zero: XOR R11 with itself zeroes the register
                    ; xor                 r9, r9                                  ; Set cxDesired; uses default if zero: XOR R9 with itself zeroes the register
                    ; mov                 r8, image_cursor                        ; Set uType
                    ; mov                 rdx, ocr_normal                         ; Set lpszName
                    ; xor                 rcx, rcx                                ; Set hInstance
                    ; WinCall         LoadImage, 6, rcx, rdx, r8, r9, r11, lr_cur ; Load the standard cursor
                    ; mov                 wcl.hCursor, rax                        ; Set wcl.hCursor

; Load the large icon

                    ; mov                 r11, 32                                 ; Set cyDesited
                    ; mov                 r9, 32                                  ; Set cxDesired
                    ; mov                 r8, image_icon                          ; Set uType
                    ; lea                 rdx, LargeIconResource                  ; Set lpszName
                    ; mov                 rcx, hInstance                          ; Set hInstance
                    ; WinCall         LoadImage, 6, rcx, rdx, r8, r9, r11, lr_cur ; Load the large icon
                    ; mov                 wcl.hIcon, rax                          ; Set wcl.hIcon

; Load the small icon

                    ; mov                 r11, 32                                 ; Set cyDesited
                    ; mov                 r9, 32                                  ; Set cxDesired
                    ; mov                 r8, image_icon                          ; Set uType
                    ; lea                 rdx, SmallIconResource                  ; Set lpszName
                    ; mov                 rcx, hInstance                          ; Set hInstance
                    ; WinCall         LoadImage, 6, rcx, rdx, r8, r9, r11, lr_cur ; Load the large icon
                    ; mov                 wcl.hIconSm, rax                        ; Set wcl.hIcon

; Register the window class

                    lea                 rcx, wcl                                    ; Set lpWndClass
                    WinCall             RegisterClassEx, rcx                        ; Register the window class

; Create Compat DC
                    xor                 rcx, rcx
                    WinCall             CreateCompatibleDC, rcx
                    mov                 frame_device_context, rax                       

; Create the main window

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

; Ensure main window displayed and updated

                    mov                 rdx, sw_show                                ; Set nCmdShow
                    mov                 rcx, rax                                    ; Set hWnd
                    WinCall             ShowWindow, rcx, rdx                        ; Display the window

                    mov                 rcx, Main_Handle                            ; Set hWnd
                    WinCall             UpdateWindow, rcx                           ; Ensure window updated

; Execute the message loop

wait_msg:           xor                 r9, r9                                      ; Set wMsgFilterMax
                    xor                 r8, r8                                      ; Set wMsgFilterMin
                    xor                 rdx, rdx                                    ; Set hWnd
                    lea                 rcx, mmsg                                   ; Set lpMessage
                    WinCall             PeekMessage, rcx, rdx, r8, r9, pm_remove

                    test                rax, rax                                    ; Anything waiting?
                    jnz                 proc_msg                                    ; Yes -- process the message
                    ; jz                  breakout

;___________________[Render]_________________________________________________________________________________________
;;                    call                UpdateScene                               ; implement scene update
;;                    call                RenderScene                               ; implement software renderer

; drawPixels
;                   xor                 rcx, rcx                                    ; iterator
;                   xor                 rax, rax                                    ; multiplication result
;                   mov                 eax, render_frame.rfWidth                   ; frame width
;                   mov                 r8d, render_frame.rfHeight                  ; frame height
;                   mul                 r8d                                         ; pixel count
;                   mov                 rdx, render_frame.rfPixels                  ; addr of pixel
;       drawPixels:
;                   mov                 dword ptr [rdx + rcx * 4], ecx              ; write into pixel
;                   inc                 rcx                                         ; iterator + 1
;                   cmp                 rcx, rax                                    ; compare regs 
;                   jle                 drawPixels                                  ; is iterator < pixel count

; putPixel
                    xor                 r8, r8
                    mov                 rcx, 32                                     ; x
                    mov                 rax, 32                                     ; y
                    mov                 r8d, render_frame.rfWidth                   ; w
                    mul                 r8                                          ; y * w
                    add                 rcx, rax                                    ; x + y * w
                    mov                 rdx, render_frame.rfPixels                  ; addr of pixels
                    mov                 dword ptr [rdx + rcx * 4], 00FF00FFh        ; pixels[x + y * w] <- XXRRGGBB

                    xor                 r8, r8
                    xor                 rdx, rdx
                    mov                 rcx, Main_Handle
                    WinCall             InvalidateRect, rcx, rdx, r8

                    mov                 rcx, Main_Handle
                    WinCall             UpdateWindow, rcx
;___________________[Render]_________________________________________________________________________________________


proc_msg:           lea                 rcx, mmsg                               ; Set lpMessage
                    WinCall             TranslateMessage, rcx                   ; Translate the message

                    lea                 rcx, mmsg                               ; Set lpMessage
                    WinCall             DispatchMessage, rcx                    ; Dispatch the message


                    jmp                 wait_msg                                ; Reloop for next message

breakout:           xor                 rax, rax                                ; Zero final return – or use the return from WinMain

                    ; call                ExitProcess                              ; causes exception violation for some reason
                    ret                                                         ; Return to caller

main                endp                                                        ; End of startup procedure
                    end                                                         ; Declare end of module
