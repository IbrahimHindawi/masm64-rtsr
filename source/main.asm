;________________________________________________________________________________________________________________________
;                                                                                                                       ;
;                  RTSR MASM64: Real-Time Software Rendering in Microsoft Macro Assembler 64-bit                        ;
;                                                                                                                       ;
;_______________________________________________[Windows]________________________________________________________________
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
;_______________________________________________[Program]________________________________________________________________
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
;_______________________________________________[Entry-Point]____________________________________________________________
                                                option                      casemap:none                                ; case sensitive                                 
main                                            proc                                                                    ; main proc
                                                local                       holder:qword                                ; local variable required for WinCall macro
                                                call                        SetupMainWindow                             ; create window
;                                               mov                         Main_Handle, rax                            ; Save the main window handle
                                                call                        RunMessageLoop                              ; main program loop
                                                ret                                                                     ;
main                                            endp                                                                    ; main end
                                                end                                                                     ; Declare end of module

