;-----------------------------------------------------------------------------------------------------------------------
;                                                                                                                      -
; App-local constants.                                                                                                 -
;                                                                                                                      -
;-----------------------------------------------------------------------------------------------------------------------

;-----[A]---------------------------------------------------------------------------------------------------------------

;-----[B]---------------------------------------------------------------------------------------------------------------

buffer_size                                      equ                 1024                                              ;

;-----[C]---------------------------------------------------------------------------------------------------------------

classStyle                                       equ                 cs_vredraw OR cs_hredraw OR cs_dblclks OR cs_owndc OR cs_parentdc

client_height                                    equ                 300                                               ;
client_width                                     equ                 300                                               ;

cmnd_x                                           equ                 source_x                                          ; x
cmnd_y                                           equ                 ( source_h + source_y ) - 5                       ; y
cmnd_w                                           equ                 source_w                                          ; width
cmnd_h                                           equ                 160                                               ; height

;------[D]--------------------------------------------------------------------------------------------------------------

;------[E]--------------------------------------------------------------------------------------------------------------

;------[F]--------------------------------------------------------------------------------------------------------------

fu_load                                          equ                 lr_shared OR lr_defaultsize OR lr_vgacolor

;------[G]--------------------------------------------------------------------------------------------------------------

;------[H]--------------------------------------------------------------------------------------------------------------

;------[I]--------------------------------------------------------------------------------------------------------------

image_bitmap                                     equ                 00000000h                                         ;
image_cursor                                     equ                 00000002h                                         ;
image_icon                                       equ                 00000001h                                         ;

;------[J]--------------------------------------------------------------------------------------------------------------

;------[K]--------------------------------------------------------------------------------------------------------------

;------[L]--------------------------------------------------------------------------------------------------------------

lr_createdibsection                              equ                 00002000h                                         ;
lr_defaultcolor                                  equ                 00000000h                                         ;
lr_defaultsize                                   equ                 00000040h                                         ;
lr_loadfromfile                                  equ                 00000010h                                         ;
lr_loadmap3dcolors                               equ                 00001000h                                         ;
lr_loadtransparent                               equ                 00000020h                                         ;
lr_monochrome                                    equ                 00000001h                                         ;
lr_shared                                        equ                 00008000h                                         ;
lr_vgacolor                                      equ                 00000080h                                         ;

lr_cur equ lr_shared OR lr_vgacolor or lr_defaultsize
;------[M]--------------------------------------------------------------------------------------------------------------

main_style                                       equ                 ws_visible or ws_tiledwindow or ws_popup or ws_border

max_path                                         equ                 256                                               ;

mem1_x                                           equ                 source_w - 18                                     ; x
mem1_y                                           equ                 source_y                                          ; y
mem1_w                                           equ                 ( regs_x - source_w ) + 31                        ; width
mem1_h                                           equ                 240                                               ; height

mem2_x                                           equ                 mem1_x                                            ; x
mem2_y                                           equ                 ( mem1_y + mem1_h ) - 5                           ; y
mem2_w                                           equ                 mem1_w                                            ; width
mem2_h                                           equ                 mem1_h                                            ; height

mem3_x                                           equ                 mem1_x                                            ; x
mem3_y                                           equ                 ( mem2_y + mem2_h ) - 5                           ; y
mem3_w                                           equ                 mem1_w                                            ; width
mem3_h                                           equ                 mem1_h                                            ; height

;------[N]--------------------------------------------------------------------------------------------------------------

;------[O]--------------------------------------------------------------------------------------------------------------

ocr_appstarting                                  equ                 32650                                             ;
ocr_cross                                        equ                 32515                                             ;
ocr_hand                                         equ                 32649                                             ;
ocr_ibeam                                        equ                 32513                                             ;
ocr_icocur                                       equ                 32647                                             ;
ocr_icon                                         equ                 32641                                             ;
ocr_no                                           equ                 32648                                             ;
ocr_normal                                       equ                 32512                                             ;
ocr_size                                         equ                 32640                                             ;
ocr_sizeall                                      equ                 32646                                             ;
ocr_sizenesw                                     equ                 32643                                             ;
ocr_sizens                                       equ                 32645                                             ;
ocr_sizenwse                                     equ                 32642                                             ;
ocr_sizewe                                       equ                 32644                                             ;
ocr_up                                           equ                 32516                                             ;
ocr_wait                                         equ                 32514                                             ;

;------[P]--------------------------------------------------------------------------------------------------------------

;------[Q]--------------------------------------------------------------------------------------------------------------

;------[R]--------------------------------------------------------------------------------------------------------------

regs_x                                           equ                 1519                                              ; x
regs_y                                           equ                 source_y                                          ; y
regs_w                                           equ                 286                                               ; width
regs_h                                           equ                 952                                               ; height

;------[S]--------------------------------------------------------------------------------------------------------------

source_x                                         equ                 -5                                                ; x
source_y                                         equ                 72                                                ; y
source_w                                         equ                 810                                               ; width
source_h                                         equ                 795                                               ; height

;------[T]--------------------------------------------------------------------------------------------------------------

;------[U]--------------------------------------------------------------------------------------------------------------

;------[V]--------------------------------------------------------------------------------------------------------------

;------[W]--------------------------------------------------------------------------------------------------------------

watch_x                                          equ                 source_w - 18                                     ; x
watch_y                                          equ                 ( mem3_y + mem3_h ) - 5                           ; y
watch_w                                          equ                 mem1_w                                            ; width
watch_h                                          equ                 mem1_h + 4                                        ; height

;------[X]--------------------------------------------------------------------------------------------------------------

;------[Y]--------------------------------------------------------------------------------------------------------------

;------[Z]--------------------------------------------------------------------------------------------------------------
