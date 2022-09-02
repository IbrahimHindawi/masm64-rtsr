
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

;drawPixel           proc
;                    xor                 r8, r8
;                    mov                 rcx, 32                                     ; x
;                    mov                 rax, 32                                     ; y
;                    mov                 r8d, render_frame.rfWidth                   ; w
;                    mul                 r8                                          ; y * w
;                    add                 rcx, rax                                    ; x + y * w
;                    mov                 rdx, render_frame.rfPixels                  ; addr of pixels
;                    mov                 dword ptr [rdx + rcx * 4], 00FF00FFh        ; pixels[x + y * w] <- XXRRGGBB
;                    ret
;drawPixel           endp

; drawPixel( rcx: renderFrame, rdx: posX, r8: posY )
; lea rcx render_frame
; mov rdx, 30
; mov r8, 30
func                proc
                    mov                 eax, [rcx.renderFrame.rfWidth]              ; eax <- w
                    mul                 edx                                         ; eax <- y * w
                    add                 eax, r8d                                    ; eax += y * w
                    mov                 rdx, [rcx.renderFrame.rfPixels]             ; rdx <- &pixels
                    mov                 dword ptr [rdx + rax * 4], 00FF00FFh        ; pixels[x + y * w] <- color
                    ret
func                endp

