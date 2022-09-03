; drawPixel( rcx: posX, rdx: posY, r8: &renderFrame, r9: color)
drawPixel           proc
                    mov                 eax, [r8.renderFrame.rfWidth]               ; eax <- w
                    mul                 edx                                         ; eax <- y * w
                    add                 eax, ecx                                    ; eax <- y * w + x
                    mov                 rdx, [r8.renderFrame.rfPixels]              ; rdx <- &pixels
                    mov                 dword ptr [rdx + rax * 4], r9d              ; pixels[x + y * w] <- color

                    xor                 rax, rax                                    ; exit code
                    ret
drawPixel           endp

; drawLine( rcx: posX, rdx: posY, r8: &renderFrame, r9: color, r11: width)
drawLine            proc

                    mov                 eax, [r8.renderFrame.rfWidth]               ; eax <- rcx | w
                    mul                 edx                                         ; eax *= edx | w * y
                    add                 eax, ecx                                    ; eax += r8d | w * y + x | stride
                    mov                 rdx, [r8.renderFrame.rfPixels]              ; rdx <- &pixels
                    add                 r11d, eax                                   ; r12d += width

                    draw:
                    mov                 dword ptr [rdx + rax * 4], r9d
                    inc                 eax
                    cmp                 eax, r11d
                    jle                 draw

                    xor                 rax, rax                                    ; exit code
                    ret
drawLine            endp

; drawRect( rcx: posX, rdx: posY, r8: &renderFrame, r9: color, r11: width, r12: height)
drawRect            proc

                    mov                 eax, [rcx.renderFrame.rfWidth]              ; eax <- rcx | w
                    mul                 edx                                         ; eax *= edx | w * y
                    add                 eax, ecx                                    ; eax += r8d | w * y + x | stride
                    mov                 rdx, [r8.renderFrame.rfPixels]              ; address of pixelbuffer
                    add                 r9d, eax                                    ; r9d += eax | posX + stride

                    draw:
                    mov                 dword ptr [rdx + rax * 4], 0000FFFFh
                    inc                 eax
                    cmp                 rax, r9
                    jle                 draw

                    xor                 rax, rax                                    ; exit code
                    ret
drawRect            endp
