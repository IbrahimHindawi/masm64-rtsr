;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;       RTSR MASM64: Real-Time Software Rendering in Microsoft Macro Assembler 64-bit                                               ;
;                                                                                                                                   ;
;-----------------------------------------------[Windows]---------------------------------------------------------------------------;
                                                include                     windows/windows.asm                                     ; windows api module
;-----------------------------------------------[Modules]---------------------------------------------------------------------------;
                                                include                     gengrid.asm
;-----------------------------------------------[Program]---------------------------------------------------------------------------;
                                                ;static                                                                             ;
                                                include                     structs.asm                                             ; program structs
                                                .data                                                                               ;
                                                include                     strings.asm                                             ; program strings
                                                include                     variables.asm                                           ; program variables
                                                .code                                                                               ;
                                                include                     callbacks.asm                                           ; program callbacks
                                                include                     common.asm                                              ; program lookups
                                                include                     general.asm                                             ; program logic
                                                include                     renderprocs.asm                                         ; program renderer
;-----------------------------------------------[Entry-Point]-----------------------------------------------------------------------;
                                                option                      casemap:none                                            ; case sensitive                                 
;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
; main                                                                                                                              ;
;                                                                                                                                   ;
;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
; In:  <No Parameters>                                                                                                              ;
;                                                                                                                                   ;
; This function is the main entry point to the program.                                                                             ;
;                                                                                                                                   ;
;-----------------------------------------------------------------------------------------------------------------------------------;
main                                            proc                                                                                ; main proc
                                                ;-----------------------------------------------------------------------------------;
                                                local                       holder:qword                                            ; local variable required for WinCall macro
                                                call                        SetupMainWindow                                         ; create window
                                                call                        RunMessageLoop                                          ; main program loop
                                                ret                                                                                 ;
                                                ;-----------------------------------------------------------------------------------;
main                                            endp                                                                                ; main end
                                                ;-----------------------------------------------------------------------------------;
                                                end                                                                                 ; Declare end of module
;-----------------------------------------------------------------------------------------------------------------------------------;
