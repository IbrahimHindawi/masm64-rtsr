;---------------------------------------------------------------------------------------------------------------------------------------;
;           generate a 2d or 3d grid                                                                                                    ;
;---------------------------------------------------------------------------------------------------------------------------------------;
;           current algorithm is not too optimized                                                                                      ;
;           can be re-written to use less instructions thanks to the `comiss` instruction                                               ;
;           the main formula is: x * n^0 + y * n^1 + z * n^2 ...                                                                        ;
;           if the flat array index counter is divisible by the dimension count without a                                               ;
;           remainder then it is the start of a row in a 2d matrix.                                                                     ;
;---------------------------------------------------------------------------------------------------------------------------------------;
                                                ifndef gengrid_asm                                                                      ; header guard
                                                gengrid_asm = 0                                                                         ; header guard variable
;---------------------------------------------------------------------------------------------------------------------------------------;
                                                include                    maths.asm

;----------[const section]--------------------------------------------------------------------------------------------------------------;
.const                                                                                                                                  ;
dimension_1d                                    equ                        8                                                            ;
dimension_2d                                    equ                        dimension_1d * dimension_1d                                  ;
dimension_3d                                    equ                        dimension_1d * dimension_1d * dimension_1d                   ;
;----------[data section]---------------------------------------------------------------------------------------------------------------;
.data                                                                                                                                   ;
                                                align 4
zero                                            real4                       0.0                                                         ;
one                                             real4                       1.0                                                         ;
two                                             real4                       2.0                                                         ;
startval                                        real4                      -1.0                                                         ; first value of the row
incr                                            real4                       ?                                                           ; incremental displacement

mult                                            real4                       50.0                                                        ; scalar multiplier
disp                                            real4                       200.0                                                       ; scalar multiplier

                                                align 16
aov                                             vector3                    dimension_2d * sizeof vector3 dup({})                        ; static memory allocation for array of vectors
sizeaov                                         =                          ( $ - aov ) / sizeof vector3                                 ; compute size of array in bytes
lenaov                                          =                          dimension_2d                                                 ; element count

                                                align 16
tov                                             vector3                    dimension_3d * sizeof vector3 dup({})                        ; static memory allocation for tensor of vectors
sizetov                                         =                          ( $ - tov ) / sizeof vector3                                 ; compute size of tensor in bytes
lentov                                          =                          dimension_3d                                                 ; element count

                                                align 16
tov_render                                      vector3                    dimension_3d * sizeof vector3 dup({})                        ; static memory allocation for tensor of vectors

                                                align 16
tov_proj                                        vector2                    dimension_3d * sizeof vector2 dup({})                        ; static memory allocation for tensor of vectors
sizetov_proj                                    =                          ( $ - tov_proj ) / sizeof vector2                            ; compute size of tensor in bytes
lentov_proj                                     =                          dimension_3d                                                 ; element count
;----------[code section]---------------------------------------------------------------------------------------------------------------;
.code

;----------[procedure]------------------------------------------------------------------------------------------------------------------;
;           gen2dgrid                                                                                                                   ;
;----------[parameters]-----------------------------------------------------------------------------------------------------------------;
;           r8   arraylength                                                                                                            ;
;           r9   dimension count                                                                                                        ;
;           r10  address of array                                                                                                       ;
;           xmm0 start value                                                                                                            ;
;           xmm2 incremental displacement                                                                                               ;
;---------------------------------------------------------------------------------------------------------------------------------------;
gen2dgrid                                       proc
                                                xor                         rcx, rcx                                                    ; reset index counter
;                                               lea                         r10, aov                                                    ; address of the array of vectors
;                                               mov                         r9, dimension_1d                                            ; dimension to compare modulus

;                                               movss                       xmm2, incr                                                  ; increment displacement parameter
;                                               movss                       xmm0, startval                                              ; row starting value
                                                movss                       xmm1, xmm0                                                  ; set to row starting value
                                                movss                       xmm4, xmm0                                                  ; save staring value
                                                subss                       xmm1, xmm2                                                  ; prime xmm1 reg for algorithm
;                                               movss                       xmm3, z                                                     ; z dimension

                                                loopaov:
                                                mov                         rax, rcx
                                                xor                         rdx, rdx
                                                idiv                        r9
                                                cmp                         rdx, 0                                                      ; test if the row is starting
                                                jz                          rowstart
                                                jnz                         rowfill

                                                rowstart:
                                                movss                       xmm0, xmm4
                                                addss                       xmm1, xmm2
                                                movss                       dword ptr [r10].vector3.x, xmm0
                                                movss                       dword ptr [r10].vector3.y, xmm1
                                                movss                       dword ptr [r10].vector3.z, xmm3
                                                jmp                         elementfinalize


                                                rowfill:
                                                addss                       xmm0, xmm2
                                                movss                       dword ptr [r10].vector3.x, xmm0
                                                movss                       dword ptr [r10].vector3.y, xmm1
                                                movss                       dword ptr [r10].vector3.z, xmm3

                                                elementfinalize:            
                                                add                         r10, sizeof vector3
                                                inc                         rcx
                                                cmp                         rcx, r8
                                                jl                          loopaov
                                                
                                                ret
gen2dgrid                                       endp
;----------[procedure]------------------------------------------------------------------------------------------------------------------;
;           gen3dgrid                                                                                                                   ;
;----------[parameters]-----------------------------------------------------------------------------------------------------------------;
;           r8   arraylength                                                                                                            ;
;           r9   dimension count                                                                                                        ;
;           r10  address of array                                                                                                       ;
;           xmm0 start value                                                                                                            ;
;           xmm2 incremental displacement                                                                                               ;
;---------------------------------------------------------------------------------------------------------------------------------------;
gen3dgrid                                       proc
;                                               lea                         r10, tov                                                    ; tensor address
;                                               mov                         r9, dimension_1d                                            ; dimension
;                                               movss                       xmm0, startval                                              ; start value
;                                               movss                       xmm2, incr                                                  ; incremental displacement
;                                               movss                       xmm3, startval                                              ; aisle start value
                                                xor                         r11, r11                                                    ; reset loop counter
                                                aisleloop:
                                                movss                       xmm0, startval
                                                movss                       xmm2, incr
                                                call                        gen2dgrid
                                                addss                       xmm3, incr
                                                add                         r11, r8                                                     ; add grid size to counter
                                                cmp                         r11, lentov                                                 ; compare with max tensor size
                                                jl                          aisleloop
                                                ret
gen3dgrid                                       endp

;----------[procedure]------------------------------------------------------------------------------------------------------------------;
;           gengrid                                                                                                                     ;
;----------[parameters]-----------------------------------------------------------------------------------------------------------------;
;           takes no parameters                                                                                                         ;
;---------------------------------------------------------------------------------------------------------------------------------------;
gengrid                                         proc

;                                               lea                         r10, aov
;                                               mov                         r9, dimension_1d
;                                               mov                         r8, lenaov
;                                               movss                       xmm0, startval
;                                               movss                       xmm2, incr
;                                               movss                       xmm3, zero
;                                               call                        gen2dgrid

                                                ;----[Compute Grid Increment]------------------------------------------------------------
                                                ; increment = 1 / (dimension_1d / 2)
                                                movss                       xmm0, two
                                                mov                         rax, dimension_1d
                                                cvtsi2ss                    xmm1, rax
                                                divss                       xmm1, xmm0
                                                movss                       xmm0, one
                                                divss                       xmm0, xmm1
                                                movss                       incr, xmm0

                                                ;----[Setup Grid]------------------------------------------------------------------------
                                                lea                         r10, tov
                                                mov                         r9, dimension_1d
                                                mov                         r8, lenaov
                                                movss                       xmm0, startval
                                                movss                       xmm2, incr
                                                movss                       xmm3, startval
                                                call                        gen3dgrid

                                                ret
gengrid                                         endp
;-----------------------------------------------------------------------------------------------------------------------------------;
                                                endif                                                                               ; header guard end
;-----------------------------------------------------------------------------------------------------------------------------------;

