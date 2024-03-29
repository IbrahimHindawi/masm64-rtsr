;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           Mathematics                                                                                                             ;
;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           Module that contains mathematical structures and functions                                                              ;
;-----------------------------------------------------------------------------------------------------------------------------------;
                                                ifndef Maths_asm                                                                    ; header guard
                                                Maths_asm = 0                                                                       ; header guard variable
;-----------------------------------------------------------------------------------------------------------------------------------;
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
                                                align 4
pi                                              real4               3.141592356589                                                  ; pi
sinofhalfpi                                     real4               0.8660254
cosofhalfpi                                     real4               0.5
degtorad                                        real4               0.0174532925                                                    ; degrees to radians: pi / 180
half                                            real4               180.0                                                           ; half a revolution

;----------[data section]-----------------------------------------------------------------------------------------------------------;
                                                .data                       
                                                align 4
tempcos                                         real4               ?
tempsin                                         real4               ?
junk                                            real4               0.0
;----------[code section]-----------------------------------------------------------------------------------------------------------;
                                                .code                       
;----------[procedure]--------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           projection                                                                                                              ;
;                                                                                                                                   ;
;----------[parameters]-------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           rcx  source 3d array of points                                                                                          ;
;           rdx  destination 2d array of points                                                                                     ;
;           xmm0 field of view                                                                                                      ;
;                                                                                                                                   ;
;----------[description]------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;-----------------------------------------------------------------------------------------------------------------------------------;
projection                                      proc

                                                movss               xmm1, [rcx].vector3.x
                                                movss               xmm2, [rcx].vector3.z
                                                mulss               xmm1, xmm0
                                                divss               xmm1, xmm2
                                                movss               [rdx].vector2.x, xmm1

                                                movss               xmm1, [rcx].vector3.y
                                                movss               xmm2, [rcx].vector3.z
                                                mulss               xmm1, xmm0
                                                divss               xmm1, xmm2
                                                movss               [rdx].vector2.y, xmm1

                                                ret
projection                                      endp

;----------[procedure]--------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           vector3_rotate_x                                                                                                        ;
;                                                                                                                                   ;
;----------[parameters]-------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           rcx  address of destination vector                                                                                      ;
;           xmm0 angle                                                                                                              ;
;                                                                                                                                   ;
;----------[description]------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;          x                                                                                                                        ;
;          y * cos(angle) - z * sin(angle)                                                                                          ;
;          y * sin(angle) + z * cos(angle)                                                                                          ;
;                                                                                                                                   ;
;-----------------------------------------------------------------------------------------------------------------------------------;
vector3_rotate_x                                proc
;                                               convert from degrees to radians
                                                movss               xmm1, degtorad
                                                mulss               xmm0, xmm1
                                                movss               tempcos, xmm0
                                                movss               tempsin, xmm0
;                                               cos(angle)
                                                fld                 tempcos
                                                fcos
                                                fst                 tempcos
                                                fstp                st(0)
                                                movss               xmm1, tempcos
;                                               movss               xmm1, cosofhalfpi
;                                               sin(angle)
                                                fld                 tempsin
                                                fsin
                                                fst                 tempsin
                                                fstp                st(0)
                                                movss               xmm2, tempsin
;                                               movss               xmm2, sinofhalfpi
;                                               copy x
;                                               load y & z
                                                movss               xmm3, [rcx].vector3.y
                                                movss               xmm4, [rcx].vector3.z
;                                               calculate y
                                                xorps               xmm5, xmm5
                                                xorps               xmm6, xmm6
                                                movss               xmm5, xmm3                                                      ; y
                                                mulss               xmm5, xmm1                                                      ; y * cos(angle)
                                                movss               xmm6, xmm4                                                      ; z
                                                mulss               xmm6, xmm2                                                      ; z * sin(angle)
                                                subss               xmm5, xmm6
                                                movss               [rcx].vector3.y, xmm5
;                                               calculate z
                                                xorps               xmm5, xmm5
                                                xorps               xmm6, xmm6
                                                movss               xmm5, xmm3                                                      ; y
                                                mulss               xmm5, xmm2                                                      ; y * sin(angle)
                                                movss               xmm6, xmm4                                                      ; z
                                                mulss               xmm6, xmm1                                                      ; z * cos(angle)
                                                addss               xmm5, xmm6
                                                movss               [rcx].vector3.z, xmm5
                                                ret
vector3_rotate_x                                endp

;----------[procedure]--------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           vector3_rotate_y                                                                                                        ;
;                                                                                                                                   ;
;----------[parameters]-------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           rcx  address of destination vector                                                                                      ;
;           xmm0 angle                                                                                                              ;
;                                                                                                                                   ;
;----------[description]------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           x * cos(angle) - z * sin(angle)                                                                                         ;
;           y                                                                                                                       ;
;           x * sin(angle) + z * cos(angle)                                                                                         ;
;                                                                                                                                   ;
;-----------------------------------------------------------------------------------------------------------------------------------;
vector3_rotate_y                                proc
;                                               convert from degrees to radians
                                                movss               xmm1, degtorad
                                                mulss               xmm0, xmm1
                                                movss               tempcos, xmm0
                                                movss               tempsin, xmm0
;                                               cos(angle)
                                                fld                 tempcos
                                                fcos
                                                fst                 tempcos
                                                fstp                st(0)
                                                movss               xmm1, tempcos
;                                               movss               xmm1, cosofhalfpi
;                                               sin(angle)
                                                fld                 tempsin
                                                fsin
                                                fst                 tempsin
                                                fstp                st(0)
                                                movss               xmm2, tempsin
;                                               movss               xmm2, sinofhalfpi
;                                               copy y
;                                               load x & z
                                                movss               xmm3, [rcx].vector3.x
                                                movss               xmm4, [rcx].vector3.z
;                                               calculate x
                                                xorps               xmm5, xmm5
                                                xorps               xmm6, xmm6
                                                movss               xmm5, xmm3                                                      ; x
                                                mulss               xmm5, xmm1                                                      ; x * cos(angle)
                                                movss               xmm6, xmm4                                                      ; z
                                                mulss               xmm6, xmm2                                                      ; z * sin(angle)
                                                subss               xmm5, xmm6
                                                movss               [rcx].vector3.x, xmm5
;                                               calculate z
                                                xorps               xmm5, xmm5
                                                xorps               xmm6, xmm6
                                                movss               xmm5, xmm3                                                      ; x
                                                mulss               xmm5, xmm2                                                      ; x * sin(angle)
                                                movss               xmm6, xmm4                                                      ; z
                                                mulss               xmm6, xmm1                                                      ; z * cos(angle)
                                                addss               xmm5, xmm6
                                                movss               [rcx].vector3.z, xmm5
                                                ret
vector3_rotate_y                                endp

;----------[procedure]--------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           vector3_rotate_z                                                                                                        ;
;                                                                                                                                   ;
;----------[parameters]-------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           rcx  address of destination vector                                                                                      ;
;           xmm0 angle                                                                                                              ;
;                                                                                                                                   ;
;----------[description]------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           x * cos(angle) - y * sin(angle)                                                                                         ;
;           x * sin(angle) + y * cos(angle)                                                                                         ;
;           z                                                                                                                       ;
;                                                                                                                                   ;
;-----------------------------------------------------------------------------------------------------------------------------------;
vector3_rotate_z                                proc
;                                               convert from degrees to radians
                                                movss               xmm1, degtorad
                                                mulss               xmm0, xmm1
                                                movss               tempcos, xmm0
                                                movss               tempsin, xmm0
;                                               cos(angle)
                                                fld                 tempcos
                                                fcos
                                                fst                 tempcos
                                                fstp                st(0)
                                                movss               xmm1, tempcos
;                                               movss               xmm1, cosofhalfpi
;                                               sin(angle)
                                                fld                 tempsin
                                                fsin
                                                fst                 tempsin
                                                fstp                st(0)
                                                movss               xmm2, tempsin
;                                               movss               xmm2, sinofhalfpi
;                                               copy z
;                                               load x & y
                                                movss               xmm3, [rcx].vector3.x
                                                movss               xmm4, [rcx].vector3.y
;                                               calculate x
                                                xorps               xmm5, xmm5
                                                xorps               xmm6, xmm6
                                                movss               xmm5, xmm3                                                      ; x
                                                mulss               xmm5, xmm1                                                      ; x * cos(angle)
                                                movss               xmm6, xmm4                                                      ; z
                                                mulss               xmm6, xmm2                                                      ; z * sin(angle)
                                                subss               xmm5, xmm6
                                                movss               [rcx].vector3.x, xmm5
;                                               calculate z
                                                xorps               xmm5, xmm5
                                                xorps               xmm6, xmm6
                                                movss               xmm5, xmm3                                                      ; x
                                                mulss               xmm5, xmm2                                                      ; x * sin(angle)
                                                movss               xmm6, xmm4                                                      ; z
                                                mulss               xmm6, xmm1                                                      ; z * cos(angle)
                                                addss               xmm5, xmm6
                                                movss               [rcx].vector3.y, xmm5
                                                ret
vector3_rotate_z                                endp

;-----------------------------------------------------------------------------------------------------------------------------------;
                                                endif                                                                               ; header guard end
;-----------------------------------------------------------------------------------------------------------------------------------;

