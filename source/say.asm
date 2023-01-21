;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           Say                                                                                                                     ;
;-----------------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                                   ;
;           Module that contains printing functionality                                                                             ;
;-----------------------------------------------------------------------------------------------------------------------------------;
                                                ifndef Say_asm                                                                      ; header guard
                                                Say_asm = 0                                                                         ; header guard variable

;----------[const section]----------------------------------------------------------------------------------------------------------;
.const
std_output_handle                               qword                                           -11
;----------[data section]-----------------------------------------------------------------------------------------------------------;
.data
                                                align 8
handle                                          qword                                           ?
reg_buffer                                      qword                                           ?

                                                align 16
tmp_buffer                                      byte                                            16 dup(0)
                                                byte                                            0Ah, 0Dh

                                                align 16
junkbuffer                                      byte                                            "AssemblyAssembly"
                                                byte                                            0Ah, 0Dh

                                                align 16
say_buffer                                      byte                                            16 dup(0)
                                                byte                                            0Ah, 0Dh
;say_buffer                                      byte                                            "hell"
;                                                byte                                            0Ah, 0Dh
;----------[code section]-----------------------------------------------------------------------------------------------------------;
.code

sayreg                                          proc
                                                push                                            rbx

                                                mov                                             reg_buffer, rcx
                                                lea                                             rcx, reg_buffer
                                                lea                                             rdx, tmp_buffer

                                                xor                                             rsi, rsi
                                                xor                                             rax, rax
                                                xor                                             rbx, rbx

                                            regloop:
                                                mov                                             al, byte ptr [rcx]
                                                mov                                             bl, al

                                                and                                             al, 00001111b
                                                cmp                                             al, 9
                                                jle                                             lo_numeric_transform
                                                ja                                              lo_alphabetic_transform

                                            lo_numeric_transform:
                                                add                                             al, 48
                                                mov                                             byte ptr [rdx + rsi], al
                                                jmp                                             hi
                                            lo_alphabetic_transform:
                                                add                                             al, 65 - 10
                                                mov                                             byte ptr [rdx + rsi], al
                                                jmp                                             hi

                                                hi:
                                                shr                                             bl, 4
                                                cmp                                             bl, 9
                                                jle                                             hi_numeric_transform
                                                ja                                              hi_alphabetic_transform

                                            hi_numeric_transform:
                                                add                                             bl, 48
                                                mov                                             byte ptr [rdx + rsi + 1], bl
                                                jmp                                             endloop
                                            hi_alphabetic_transform:
                                                add                                             bl, 65 - 10
                                                mov                                             byte ptr [rdx + rsi + 1], bl

                                            endloop:
                                                mov                                             r8, reg_buffer
                                                shr                                             r8, 8
                                                mov                                             reg_buffer, r8
;                                               inc                                             rsi
                                                add                                             rsi, 2
                                                cmp                                             rsi, 16
                                                jl                                              regloop


                                                lea                                             rcx, tmp_buffer
                                                lea                                             rdx, say_buffer
                                                mov                                             rsi, 0
                                                mov                                             rdi, 15
                                                xor                                             rax, rax
                                            flip_endianess:
                                                mov                                             al, byte ptr [rcx + rdi]

;                                               cmp                                             al, 9
;                                               jle                                             numeric_skip
;                                               sub                                             al, 32

;                                           numeric_skip:
                                                mov                                             byte ptr [rdx + rsi], al

                                                inc                                             rsi
                                                dec                                             rdi
                                                cmp                                             rsi, 16
                                                jl                                              flip_endianess

                                                sub                                             rsp, 40

                                                mov                                             rcx, std_output_handle
                                                call                                            GetStdHandle

                                                mov                                             rcx, rax
                                                lea                                             rdx, say_buffer
                                                mov                                             r8, 18
                                                xor                                             r9, r9
                                                mov                                             [rsp + 32], r9
                                                call                                            WriteFile

                                                add                                             rsp, 40
                                                pop                                             rbx
;                                               xor                                             rax, rax                            ; return zero
                                                ret                                                                                 ; return
sayreg                                          endp                                                                                ; end proc

                                                endif                                                                               ; header guard end

