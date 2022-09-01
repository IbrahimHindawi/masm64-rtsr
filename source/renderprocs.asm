
;drawPixel           proc
;                    xor                 r8, r8
;                    mov                 rcx, 32                                     ; x
;                    mov                 rax, 32                                     ; y
;                    mov                 r8d, render_frame.rfWidth                   ; w
;                    mul                 r8                                          ; y * w
;                    add                 rcx, rax                                    ; x + y * w
;                    mov                 rdx, render_frame.rfPixels                  ; addr of pixels
;                    mov                 dword ptr [rdx + rcx * 4], 00FF00FFh        ; pixels[x + y * w] <- XXRRGGBB
;drawPixel           endp

drawPixel           proc
                    xor                 r8, r8
                    mov                 rcx, 32                                     ; x
                    mov                 rax, 32                                     ; y
                    mov                 r8d, render_frame.rfWidth                   ; w
                    mul                 r8                                          ; y * w
                    add                 rcx, rax                                    ; x + y * w
                    mov                 rdx, render_frame.rfPixels                  ; addr of pixels
                    mov                 dword ptr [rdx + rcx * 4], 00FF00FFh        ; pixels[x + y * w] <- XXRRGGBB
drawPixel           endp

; drawPixel( rcx: renderFrame, rdx: posX, r8: posY )
func                proc
                    lea                 rdx, render_frame
                    mov                 rcx, [rdx.render_frame.rfPixels]
                    mov                 r8d, [rdx.render_frame.rfWidth]
func                endp

