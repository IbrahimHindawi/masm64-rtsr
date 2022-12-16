;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           Windows                                                                                                                 ;
;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           Module that contains Windows API                                                                                        ;
;-----------------------------------------------------------------------------------------------------------------------------------;
                                                ifndef Windows_asm                                                                  ; header guard
                                                Windows_asm = 0                                                                     ; header guard variable

                                                include                     macros.asm                                              ; macros
                                                include                     structuredefs.asm                                       ; windows structure definitions
                                                include                     wincons.asm                                             ; windows constants
;----------[const section]----------------------------------------------------------------------------------------------------------;
                                                .const
                                                include                     constants.asm                                           ; program constants
;----------[data section]-----------------------------------------------------------------------------------------------------------;
                                                .data                       
                                                include                     lookups.asm                                             ; event look up table
                                                include                     riid.asm                                                ; routing identifiers
                                                include                     routers.asm                                             ; lookup routers
                                                include                     diagnostics.asm                                         ; router decl
                                                include                     structures.asm                                          ; windows structure variables
;----------[code section]-----------------------------------------------------------------------------------------------------------;
                                                .code                       
                                                include                     externals.asm                                           ; windows external procedure definitions

                                                endif                                                                               ; header guard end


