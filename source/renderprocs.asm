drawPixel           proc ; ( rcx: posX, rdx: posY, r8: &renderFrame, r9: color)
                    ; safety check
                    ; if x > 0 or x < w or y > 0 or y < h
                    cmp                 ecx, 0
                    jl                  drawExit
                    cmp                 ecx, dword ptr [r8.renderFrame.rfWidth]
                    jge                 drawExit
                    cmp                 edx, 0
                    jl                  drawExit
                    cmp                 edx, dword ptr [r8.renderFrame.rfHeight]
                    jge                 drawExit

                    ; compute stride
                    ; xor                 rax, rax
                    mov                 eax, [r8.renderFrame.rfWidth]               ; eax <- w
                    mul                 edx                                         ; eax <- y * w
                    add                 eax, ecx                                    ; eax <- y * w + x

                    ; compute address & write
                    mov                 rdx, [r8.renderFrame.rfPixels]              ; rdx <- &pixels
                    mov                 dword ptr [rdx + rax * 4], r9d              ; pixels[x + y * w] <- color

                    ; clean exit
                    drawExit:
                    xor                 rax, rax                                    ; exit code
                    ret
drawPixel           endp

drawLine            proc ; ( rcx: posX, rdx: posY, r8: &renderFrame, r9: color, r11: width)
                    ; compute stride
                    mov                 eax, [r8.renderFrame.rfWidth]               ; eax <- rcx | w
                    mul                 edx                                         ; eax *= edx | w * y
                    add                 eax, ecx                                    ; eax += r8d | w * y + x | stride

                    ; compute address & write
                    mov                 rdx, [r8.renderFrame.rfPixels]              ; rdx <- &pixels
                    add                 r11d, eax                                   ; r12d += width

                    draw:
                    mov                 dword ptr [rdx + rax * 4], r9d
                    inc                 eax
                    cmp                 eax, r11d
                    jle                 draw

                    drawExit:
                    xor                 rax, rax                                    ; exit code
                    ret
drawLine            endp

drawRect            proc ; ( rcx: posX, rdx: posY, r8: &renderFrame, r9: color, r11: width, r12: height)

; drawPixel( rcx: posX, rdx: posY, r8: &renderFrame, r9: color)
                    ; mov                 r9d, 00FF00FFh                              ; color
                    ; lea                 r8, render_frame                            ; framebuffer address
                    ; mov                 edx, 32                                     ; y
                    ; mov                 ecx, 32                                     ; x


                    drawY:
                    mov                 r14d, edx                                   ; save y
                    drawX:
                    mov                 r13d, ecx                                   ; save x
                    call                drawPixel
                    mov                 ecx, r13d                                   ; restore x
                    mov                 edx, r14d                                   ; restore y
                    inc                 ecx
                    cmp                 ecx, r11d
                    jl                  drawX
                    inc                 edx
                    cmp                 edx, r12d
                    jl                  drawY

                    xor                 rax, rax                                    ; exit code
                    ret
drawRect            endp
