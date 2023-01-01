;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           Mathematics                                                                                                             ;
;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           Module that contains mathematical structures and functions                                                              ;
;-----------------------------------------------------------------------------------------------------------------------------------;
                                                ifndef Maths_asm                                                                    ; header guard
                                                Maths_asm = 0                                                                       ; header guard variable

vector2                                         struct                                                                              ; Declare structure
                                               ;-------------------------------------------------------------------------------------
x                                               real4               ?                                                               ; x
y                                               real4               ?                                                               ; y
vector2                                         ends                                                                                ; End structure declaration

vector3                                         struct                                                                              ; Declare structure
                                               ;-------------------------------------------------------------------------------------
x                                               real4               ?                                                               ; x
y                                               real4               ?                                                               ; y
z                                               real4               ?                                                               ; z
vector3                                         ends                                                                                ; End structure declaration

vector4                                         struct                                                                              ; Declare structure
                                               ;-------------------------------------------------------------------------------------
x                                               real4               ?                                                               ; x
y                                               real4               ?                                                               ; y
z                                               real4               ?                                                               ; z
w                                               real4               ?                                                               ; w
vector4                                         ends                                                                                ; End structure declaration
;----------[const section]----------------------------------------------------------------------------------------------------------;
                                                .const
;----------[data section]-----------------------------------------------------------------------------------------------------------;
                                                .data                       
;----------[code section]-----------------------------------------------------------------------------------------------------------;
                                                .code                       
;----------[procedure]--------------------------------------------------------------------------------------------------------------;
;           projection                                                                                                              ;
;----------[parameters]-------------------------------------------------------------------------------------------------------------;
;           rcx  length of array                                                                                                    ;
;           rdx  source 3d array of points                                                                                          ;
;           r8   destination 2d array of points                                                                                     ;
;           xmm0 field of view                                                                                                      ;
;-----------------------------------------------------------------------------------------------------------------------------------;
projection                                      proc

                                                mov                 r9, rcx                                                         ; save length
                                                xor                 rcx, rcx                                                        ; reset counter

                                                projloop:
                                                movss               xmm1, [rdx].vector3.x
                                                movss               xmm2, [rdx].vector3.z
                                                mulss               xmm1, xmm0
                                                divss               xmm1, xmm2
                                                movss               [r8].vector2.x, xmm1

                                                movss               xmm1, [rdx].vector3.y
                                                movss               xmm2, [rdx].vector3.z
                                                mulss               xmm1, xmm0
                                                divss               xmm1, xmm2
                                                movss               [r8].vector2.y, xmm1

                                                add                 rdx, sizeof vector3
                                                add                 r8, sizeof vector2
                                                inc                 rcx
                                                cmp                 rcx, r9
                                                jl                  projloop

                                                ret
projection                                      endp

                                                endif                                                                               ; header guard end

                                                
