;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;       RTSR MASM64: Real-Time Software Rendering in Microsoft Macro Assembler 64-bit                                               ;
;                                                                                                                                   ;
;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;       Rendering procedures                                                                                                        ;
;-----------------------------------------------------------------------------------------------------------------------------------;
                                                ifndef renderprocs_asm                                                              ; header guard
                                                renderprocs_asm = 0                                                                 ; header guard variable
;-----------------------------------------------------------------------------------------------------------------------------------;
drawPixel                                       proc ; ( rcx: posX, rdx: posY, r8: &renderFrame, r9: color)
                                                ; safety check
                                                ; if x > 0 or x < w or y > 0 or y < h
                                                cmp                         ecx, 0
                                                jl                          drawExit
                                                cmp                         ecx, dword ptr [r8.renderFrame.rfWidth]
                                                jge                         drawExit
                                                cmp                         edx, 0
                                                jl                          drawExit
                                                cmp                         edx, dword ptr [r8.renderFrame.rfHeight]
                                                jge                         drawExit

                                                ; save x & y
                                                push                        rcx
                                                push                        rdx

                                                ; compute stride
                                                ; xor                        rax, rax
                                                mov                         eax, [r8.renderFrame.rfWidth]                           ; eax <- w
                                                mul                         edx                                                     ; eax <- y * w
                                                add                         eax, ecx                                                ; eax <- y * w + x

                                                ; compute address & write
                                                mov                         rdx, [r8.renderFrame.rfPixels]                          ; rdx <- &pixels
                                                mov                         dword ptr [rdx + rax * 4], r9d                          ; pixels[x + y * w] <- color

                                                ; restore x & y
                                                pop                         rdx
                                                pop                         rcx

                                                ; clean exit
                                                drawExit:
                                                ret
drawPixel                                       endp

drawLine                                        proc ; ( rcx: posX, rdx: posY, r8: &renderFrame, r9: color, r11: width)
                                                ; safety check
                                                ; if x > 0 or x < w or y > 0 or y < h
                                                cmp                         ecx, 0
                                                jl                          drawExit
                                                cmp                         ecx, dword ptr [r8.renderFrame.rfWidth]
                                                jge                         drawExit
                                                cmp                         edx, 0
                                                jl                          drawExit
                                                cmp                         edx, dword ptr [r8.renderFrame.rfHeight]
                                                jge                         drawExit

                                                ; compute stride
                                                mov                         eax, [r8.renderFrame.rfWidth]                           ; eax <- rcx | w
                                                mul                         edx                                                     ; eax *= edx | w * y
                                                add                         eax, ecx                                                ; eax += r8d | w * y + x | stride

                                                ; compute end address
                                                mov                         rdx, [r8.renderFrame.rfPixels]                          ; rdx <- &pixels
                                                add                         r11d, eax                                               ; r12d += width

                                                draw:
                                                mov                         dword ptr [rdx + rax * 4], r9d
                                                inc                         eax
                                                cmp                         eax, r11d
                                                jle                         draw

                                                drawExit:
                                                ret
drawLine                                        endp

drawRect                                        proc ; ( rcx: posX, rdx: posY, r8: &renderFrame, r9: color, r11: width, r12: height)

                                                add                         r11d, ecx                                               ; get total width
                                                add                         r12d, edx                                               ; get total height
                                                mov                         r13d, ecx                                               ; save x

                                                drawY:
                                                drawX:
                                                call                        drawPixel                                               ; 
                                                inc                         ecx                                                     ; x += 1
                                                cmp                         ecx, r11d                                               ; x ? w
                                                jl                          drawX                                                   ; x < w -> reset
                                                mov                         ecx, r13d                                               ; reset x
                                                inc                         edx                                                     ; y += 1
                                                cmp                         edx, r12d                                               ; y ? h
                                                jl                          drawY                                                   ; y < h -> reset

                                                ret
drawRect                                        endp

fillBackground                                  proc ; ( r8: &renderFrame, r9d: color )

                                                mov                         ecx, [r8.renderFrame.rfWidth]
                                                mov                         edx, [r8.renderFrame.rfHeight]

                                                mov                         rax, rcx                                                ; load rax for multiplication
                                                mul                         rdx                                                     ; rdx:rax <- rax * rdx
                                                mov                         rcx, rax                                                ; store result into rcx
                                                mov                         rdx, [r8.renderFrame.rfPixels]                          ; rdx <- pixelbuffer addr 
                                                xor                         r8, r8                                                  ; zero r8

                                                draw:
                                                mov                         dword ptr [rdx + r8 * 4], r9d
                                                inc                         r8
                                                cmp                         r8, rcx
                                                jl                          draw

                                                ret
fillBackground                                  endp
;-----------------------------------------------------------------------------------------------------------------------------------;
                                                endif                                                                               ; header guard end
;-----------------------------------------------------------------------------------------------------------------------------------;
