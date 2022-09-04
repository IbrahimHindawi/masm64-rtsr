;_______________________________________________________________________________________________________________________;
;                                                                                                                       ;
;       RTSR MASM64: Real-Time Software Rendering in Microsoft Macro Assembler 64-bit                                   ;
;                                                                                                                       ;
;_______________________[Windows]_______________________________________________________________________________________;
                                                include                     macros.asm                                  ; macros
                                                include                     structuredefs.asm                           ; windows structure definitions
                                                include                     wincons.asm                                 ; windows constants

                                                .data                                                                   
                                                include                     lookups.asm                                 ; event look up table
                                                include                     riid.asm                                    ; routing identifiers
                                                include                     routers.asm                                 ; lookup routers
                                                include                     diagnostics.asm                             ; router decl

                                                .code                                                                   
                                                include                     externals.asm                               ; external proc defs
                                                include                     callbacks.asm                               ; callbacks
                                                include                     common.asm                                  ; lookups
;_______________________[Program]_______________________________________________________________________________________;
                                                .const
                                                include                     constants.asm                               ; program constants

                                                .data
                                                include                     structures.asm                              ; program structures
                                                include                     buffers.asm                                 ; program buffers
                                                include                     strings.asm                                 ; program strings
                                                include                     variables.asm                               ; program variables

                                                .code
                                                include                     general.asm                                 ; main app logic
                                                include                     renderprocs.asm                             ; rendering logic
;_______________________[Entry-Point]___________________________________________________________________________________;
                                                option                      casemap:none                                ; case sensitive                                 
main                                            proc                                                                    ; main proc
                                                local                       holder:qword                                ; local variable required for WinCall macro
                                                call                        SetupMainWindow                             ; create window
;                                               mov                         Main_Handle, rax                            ; Save the main window handle
                                                call                        RunMessageLoop                              ; main program loop
                                                ret                                                                     ;
main                                            endp                                                                    ; main end
                                                end                                                                     ; Declare end of module

