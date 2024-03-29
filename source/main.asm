;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;       RTSR MASM64: Real-Time Software Rendering in Microsoft Macro Assembler 64-bit                                               ;
;                                                                                                                                   ;
;-----------------------------------------------[Windows]---------------------------------------------------------------------------;
                                                include                     windows/windows.asm                                     ; windows api module
;-----------------------------------------------[Modules]---------------------------------------------------------------------------;
                                                include                     gengrid.asm
;-----------------------------------------------[Program]---------------------------------------------------------------------------;

                                                .const 
                                                ainclude                    constants.asm                                           ; program structs
                                                ainclude                    structs.asm                                             ; program structs

                                                .data                                                                               ;
                                                ainclude                    strings.asm                                             ; program strings
                                                ainclude                    variables.asm                                           ; program variables

                                                .code                                                                               ;
                                                include                     say.asm                                                 ; printing
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
