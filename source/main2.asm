;---------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                           ;
;           MASM64 Starter Project.                                                                                         ;
;---------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                           ;
;           Writes to the StdOut, then exits safely.                                                                        ;
;---------------------------------------------------------------------------------------------------------------------------;

;----------[const section]--------------------------------------------------------------------------------------------------;
                                                .const
;----------[data section]---------------------------------------------------------------------------------------------------;
                                                .data
                                                include                         windows/macros.asm                          ; Macros
                                                include                         windows/wincons.asm                         ; Windows Constants
                                                include                         windows/structuredefs.asm                   ; Windows Structures

                                                include                         strings.asm                                 ; User Strings
                                                include                         constants.asm                               ; User Constants
                                                include                         variables.asm                               ; User Variables
;----------[code section]---------------------------------------------------------------------------------------------------;
                                                .code
                                                include                         windows/externals.asm                       ; External Functions

                                                include                         callbacks.asm                               ; User Callbacks
                                                ; include                         buffers.asm                                 ; User Strings
                                                ; include                         lookups.asm                                 ; User Lookups
                                                ; include                         common.asm                                  ; User Callbacks
                                                ; include                         routers.asm                                 ; User Callbacks
                                                ; include                         diagnostics.asm                             ; User Callbacks

main                                            proc                                                                        ;

                                                local                           holder:qword
                                                Save_Registers

                                                xor                             rcx, rcx
                                                WinCall                         GetModuleHandle, rcx
                                                mov                             wnd_hInst, rax

                                                lea                             rcx, wnd
                                                WinCall                         RegisterClassEx, rcx

                                                mov                             r14, wnd_hInst                                    ; Set hInstance

                                                mov                             r13, 200                                          ; Zero R13

                                                mov                             r12, 200                                          ; Zero R12

                                                mov                             rbx, 200                                          ; Zero RBX

                                                mov                             r15, 200                            ; Get the work area height

                                                mov                             r9, main_style
                                                lea                             r8, main_winname                                  ; Set lpWindowName
                                                lea                             rdx, main_classname                               ; Set lpClassName
                                                xor                             rcx, rcx                                          ; Set dwExStyle
                                                WinCall                         CreateWindowEx, rcx, rdx, r8, r9, rbx, r15, r12, r13, 0, 0, r14, 0

                                                mov                             r15, rax
                                                mov                             rdx, sw_show
                                                mov                             rcx, rax
                                                WinCall                         ShowWindow, rcx, rdx




                                                Restore_Registers

                                                ret
main                                            endp
                                                end
