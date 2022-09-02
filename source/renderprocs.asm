; drawPixel( rcx: &renderFrame, rdx: posX, r8: posY )
drawPixel           proc
                    mov                 eax, [rcx.renderFrame.rfWidth]              ; eax <- w
                    mul                 edx                                         ; eax <- y * w
                    add                 eax, r8d                                    ; eax += y * w
                    mov                 rdx, [rcx.renderFrame.rfPixels]             ; rdx <- &pixels
                    mov                 dword ptr [rdx + rax * 4], 00FF00FFh        ; pixels[x + y * w] <- color
                    ret
drawPixel           endp

; drawRect( rcx: renderFrame, rdx: posX, r8: posY, r9: width, r11: height )
drawRect            proc
                    ; compute the start position of the rect
                    mov                 eax, [rcx.renderFrame.rfWidth]              ; eax <- rcx | w
                    mul                 edx                                         ; eax *= edx | w * y
                    add                 eax, r8d                                    ; eax += r8d | w * y + x | stride
                    mov                 rdx, [rcx.renderFrame.rfPixels]             ; address of pixelbuffer
                    add                 r9d, eax                                    ; r9d += eax | posX + stride

                    draw:
                    mov                 dword ptr [rdx + rax * 4], 0000FFFFh
                    inc                 eax
                    cmp                 rax, r9
                    jle                 draw

                    ret
drawRect            endp
