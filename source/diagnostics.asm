
;***********************************************************************************************************************
;
;

;旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
;� FixWinDbg                                                                                                                                                                                            �
;읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸


;旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
;� In:                                           <Nothing>                                                                                                                                              �
;쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
;� Return:                                       RAX = 00: no error                                                                                                                                     �
;읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

;; FixWinDbg                                        proc                                                                                                                                                  ; Declare procedure
;; 
;; ;郞袴� Entry 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴拷
;; ;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁
;; 
;; ;컴컴�[Save altered registers]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
;; 
;;                                                  local               holder:qword                                                                                                                      ;g
;;                                                  local               ParmCount:qword                                                                                                                   ;
;; 
;; ;컴컴�[Save altered registers]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
;; 
;;                                                  Save_Registers                                                                                                                                        ; Save altered registers
;; 
;; ;郞袴� Process 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴拷
;; ;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁
;; 
;;                                                  ;袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴
;;                                                  ;
;;                                                  ; Enumerate windows to size each.
;; 
;;                                                  ;컴컴�[Get current desktop handle]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
;; 
;;                                                  mov                 fwpr_index,0                                                                                                                      ; Initialize item index
;;                                                  WinCall             GetCurrentThreadId                                                                                                                ; Execute call
;;                                                  mov                 rcx,rax                                                                                                                           ; Set nIDThread
;;                                                  WinCall             GetThreadDesktop, rcx                                                                                                             ; Execute call
;; 
;;                                                  ;컴컴�[Get WinDbg main window handle]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
;; 
;;                                                  xor                 rcx, rcx                                                                                                                          ; Set lParam
;;                                                  lea                 rdx, FWDb_Proc                                                                                                                    ; Set lpfn
;;                                                  mov                 r8,rax                                                                                                                            ; Set hDesktop
;;                                                  WinCall             EnumDesktopWindows, rcx, rdx, r8                                                                                                  ; Execute call
;; 
;;                                                  ;컴컴�[Zero final return]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
;; 
;;                                                  xor                 rax,rax                                                                                                                           ; Zero final return
;; 
;; ;郞袴� Exit 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
;; ;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁
;; 
;; ;컴컴�[Restore altered registers]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
;; 
;;                                                  Restore_Registers                                                                                                                                     ; Restore altered registers
;; 
;; ;컴컴�[Return to caller]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
;; 
;;                                                  ret                                                                                                                                                   ; Return to caller
;; 
;; FixWinDbg                                        endp

;旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
;� FWDb_Proc                                                                                                                                                                                            �
;읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
;
; EnumDesktopWindows callback
;
;旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
;� In:                                           rcx         = hWnd                                                                                                                                     �
;�                                               rdx         = lParam                                                                                                                                   �
;쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
;�                                                                                                                                                                                                      �
;읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

FWDb_Proc                                        proc                                                                                                                                                  ; Declare procedure

;郞袴� Entry 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴拷
;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁

;컴컴�[Local data]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

                                                 local               holder:qword                                                                                                                      ;
                                                 local               hwnd:qword                                                                                                                        ;
                                                 local               lParam:qword                                                                                                                      ;

;컴컴�[Save altered registers]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

                                                 Save_Registers                                                                                                                                        ; Save altered registers

;郞袴� Process 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴拷
;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁

                                                 ;袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴
                                                 ;
                                                 ;

                                                 ;컴컴�[Save incoming values]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 mov                 hWnd,rcx                                                                                                                          ;
                                                 mov                 lParam,rdx                                                                                                                        ;

                                                 ;컴컴�[Get window parent (or window if no parent) title string]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

                                                 WinCall             GetParent, rcx                                                                                                                    ; Get parent handle <--- RCX is already set to hWnd
                                                 mov                 rcx,rax                                                                                                                           ; Set hWnd value for call
                                                 test                rcx,rcx                                                                                                                           ; Null parent?
                                                 jnz                 fwpr_00001                                                                                                                        ; No 컴 use parent
                                                 mov                 rcx,hwnd                                                                                                                          ; Yes 컴 use handle
fwpr_00001:                                      lea                 rdx,gen_buff                                                                                                                      ; Set lpString
                                                 mov                 r8,buffer_size                                                                                                                    ; Set nMaxCount
                                                 WinCall             GetWindowText, rcx, rdx, r8                                                                                                       ; Execute call
                                                 mov                 rcx,rax                                                                                                                           ; Set scan count

                                                 ;컴컴�[Exit if no name for this window]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

                                                 test                rax, rax                                                                                                                          ; Null string?
                                                 jz                  fwpr_last                                                                                                                         ; Yes 컴 do net window

                                                 ;컴컴�[Locate � in title string]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 mov                 rcx, rax                                                                                                                          ; Set the scan count
                                                 lea                 rdi,gen_buff [ rax ]                                                                                                              ; Set scan start pointer
                                                 mov                 al,'-'                                                                                                                            ; Set scan target
                                                 std                                                                                                                                                   ; Reverse scan direction
                                                 repnz               scasb                                                                                                                             ; Execute scan
                                                 cld                                                                                                                                                   ; Clear direction flag
                                                 jnz                 fwpr_last                                                                                                                         ; Not found 컴 do next window
                                                 scasw                                                                                                                                                 ; Adjust for overshot

                                                 ;컴컴�[Check for # after �]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

                                                 cmp                 byte ptr [rdi],' '                                                                                                                ; # separator?
                                                 jnz                 fwpr_last                                                                                                                         ; No 컴 no process
                                                 scasb                                                                                                                                                 ; Skip over # separator

                                                 ;컴컴�[Size the ID string after -]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 mov                 rsi,rdi                                                                                                                           ; Save the compare source pointer
                                                 xor                 al,al                                                                                                                             ; Set the scan target
                                                 mov                 rcx,-1                                                                                                                            ; Set max scan count
                                                 repnz               scasb                                                                                                                             ; Execute scan
                                                 not                 rcx                                                                                                                               ; Reverse sign
                                                 dec                 rcx                                                                                                                               ; Discount terminating 0

                                                 ;컴컴�[Branch if no string size match]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 cmp                 rcx,qword ptr win_id                                                                                                              ; Size match?
                                                 jnz                 fwpr_last                                                                                                                         ; No -- no process

                                                 ;컴컴�[Get this window title string]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 mov                 rcx,hWnd                                                                                                                          ; Reset this handle
                                                 lea                 rdx,gen_buff                                                                                                                      ; Set the buffer pointer
                                                 mov                 r8,buffer_size                                                                                                                    ; Set nMaxCount
                                                 WinCall             GetWindowText, rcx, rdx, r8                                                                                                       ; Execute call

                                                 ;컴컴�[Validate non-zero buffer]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
                                                 ;
                                                 ; Some shithole amateur created a window whose text is 84h or 132 bytes of 0.  This has to be accounted for here.

                                                 lea                 rdi, gen_buff                                                                                                                     ;
                                                 mov                 rcx, buffer_size                                                                                                                  ;
                                                 xor                 al,al                                                                                                                             ;
                                                 repz                scasb                                                                                                                             ;
                                                 jz                  fwpr_last                                                                                                                         ;

                                                 ;컴컴�[Size the first word of the string]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
                                                 ;
                                                 ; This is a WinDbg window.  The first word, followed by #-#, will either be Memory, Registers,
                                                 ; Command, or Watch.  If none of these match, check the parent handle.  If it's zero, this is the
                                                 ; main window and we don't change it.  Otherwise it's a source window.

                                                 lea                 rdi,gen_buff [ rax ]                                                                                                              ; Set the scan start pointer
                                                 mov                 rsi,rdi                                                                                                                           ; Save the source pointer
                                                 mov                 rcx,-1                                                                                                                            ; Set max scan count
                                                 mov                 al,' '                                                                                                                            ; Set scan target
                                                 repnz               scasb                                                                                                                             ; Execute scan
                                                 not                 rcx                                                                                                                               ; Reverse sign
                                                 dec                 rcx                                                                                                                               ; Discount terminating 0
                                                 mov                 byte ptr [rdi-1],0                                                                                                                ; Change first # to terminator

                                                 ;컴컴�[Index the string]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 lea                 rcx, gen_buff                                                                                                                     ; Set the buffer pointer
                                                 lea                 rdx, win_list                                                                                                                     ; Set the data list pointer
                                                 LocalCall           Common_LookupString                                                                                                               ; Execute call

                                                 ;컴컴�[Use index 4 for source windows]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 cmp                 rax,-1                                                                                                                            ; Source window?
                                                 jnz                 fwpr_00002                                                                                                                        ; No -- leave current index

                                                 ;컴컴�[컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

                                                 mov                 rcx,hwnd                                                                                                                          ;
                                                 WinCall             GetParent, rcx                                                                                                                    ;
                                                 test                rax,rax                                                                                                                           ;
                                                 jz                  fwpr_last                                                                                                                         ;

                                                 mov                 rax,4                                                                                                                             ; Yes -- use index 4

                                                 ;컴컴�[Callout for window type]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

fwpr_00002:                                      shl                 rax,3                                                                                                                             ; Scale to * 8 for qword size
                                                 lea                 rbx,fwpr_rte                                                                                                                      ;
                                                 add                 rax,rbx                                                                                                                           ;
                                                 jmp                 qword ptr [rax]                                                                                                                   ;

;郞袴� 0: command 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁

                                                 ;컴컴�[Set new window position]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

                                                 align               dword                                                                                                                             ; Set dword alignment
fwpr_00100                                       label               near                                                                                                                              ; Declare near label
                                              ;  mov                 qword ptr [rsp+28h],1                                                                                                             ; Set bRedraw
                                              ;  mov                 rax,cmnd_h                                                                                                                        ; Get the window height
                                              ;  mov                 qword ptr [rsp+20h],rax                                                                                                           ; Set nHeight
                                                 mov                 r9,cmnd_w                                                                                                                         ; Set nWidth
                                                 mov                 r8,cmnd_y                                                                                                                         ; Set y
                                                 mov                 rdx,cmnd_x                                                                                                                        ; Set x
                                                 mov                 rcx,hwnd                                                                                                                          ; Set hWnd
                                                 WinCall             MoveWindow, rcx, rdx, r8, r9, cmnd_h, 1                                                                                           ; Execute call

                                                 ;컴컴�[Skip remainder of processes]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

                                                 jmp                 fwpr_last                                                                                                                         ; Skip remainder of processes

;郞袴� 1: memory 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴拷
;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁

                                                 ;컴컴�[Branch if not first hit]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 align               dword                                                                                                                             ; Set dword alignment
fwpr_00200                                       label               near                                                                                                                              ; Declare near label
                                                 cmp                 fwpr_index,0                                                                                                                      ; First hit?
                                                 jnz                 fwpr_00201                                                                                                                        ; No 컴 process second memory window

                                                 ;컴컴�[Set new window position: window 1]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                              ;  mov                 qword ptr [rsp+28h],1                                                                                                             ; Set bRedraw
                                              ;  mov                 rax,mem1_h                                                                                                                        ; Get the window height
                                              ;  mov                 qword ptr [rsp+20h],rax                                                                                                           ; Set nHeight
                                                 mov                 r9,mem1_w                                                                                                                         ; Set nWidth
                                                 mov                 r8,mem1_y                                                                                                                         ; Set y
                                                 mov                 rdx,mem1_x                                                                                                                        ; Set x
                                                 mov                 rcx,hwnd                                                                                                                          ; Set hWnd
                                                 WinCall             MoveWindow, rcx, rdx, r8, r9, mem1_h, 1                                                                                           ; Execute call

                                                 ;컴컴�[Skip remainder of processes]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 inc                 fwpr_index                                                                                                                        ; Increment hit index
                                                 jmp                 fwpr_last                                                                                                                         ; Skip remainder of processes

                                                 ;컴컴�[Branch if not second hit]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

fwpr_00201:                                      cmp                 fwpr_index,1                                                                                                                      ; First hit?
                                                 jnz                 fwpr_00202                                                                                                                        ; No 컴 process second memory window

                                                 ;컴컴�[Set new window position: window 1]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                              ;  mov                 qword ptr [rsp+28h],1                                                                                                             ; Set bRedraw
                                              ;  mov                 rax,mem2_h                                                                                                                        ; Get the window height
                                              ;  mov                 qword ptr [rsp+20h],rax                                                                                                           ; Set nHeight
                                                 mov                 r9,mem2_w                                                                                                                         ; Set nWidth
                                                 mov                 r8,mem2_y                                                                                                                         ; Set y
                                                 mov                 rdx,mem2_x                                                                                                                        ; Set x
                                                 mov                 rcx,hwnd                                                                                                                          ; Set hWnd
                                                 WinCall             MoveWindow, rcx, rdx, r8, r9, mem2_h, 1                                                                                           ; Execute call

                                                 ;컴컴�[Skip remainder of processes]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 inc                 fwpr_index                                                                                                                        ; Increment hit index
                                                 jmp                 fwpr_last                                                                                                                         ; Skip remainder of processes

                                                 ;컴컴�[Set new window position]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

fwpr_00202:                                   ;  mov                 qword ptr [rsp+28h],1                                                                                                             ; Set bRedraw
                                              ;  mov                 rax,mem3_h                                                                                                                        ; Get the window height
                                              ;  mov                 qword ptr [rsp+20h],rax                                                                                                           ; Set nHeight
                                                 mov                 r9,mem3_w                                                                                                                         ; Set nWidth
                                                 mov                 r8,mem3_y                                                                                                                         ; Set y
                                                 mov                 rdx,mem3_x                                                                                                                        ; Set x
                                                 mov                 rcx,hwnd                                                                                                                          ; Set hWnd
                                                 WinCall             MoveWindow, rcx, rdx, r8, r9, mem3_h, 1                                                                                           ; Execute call

                                                 ;컴컴�[Skip remainder of processes]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 inc                 fwpr_index                                                                                                                        ; Increment hit index
                                                 jmp                 fwpr_last                                                                                                                         ; Skip remainder of processes

;郞袴� 2: registers 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁

                   ;컴컴�[Set new window position]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 align               dword                                                                                                                             ; Set dword alignment
fwpr_00300                                       label               near                                                                                                                              ; Declare near label
                                              ;  mov                 qword ptr [rsp+28h],1                                                                                                             ; Set bRedraw
                                              ;  mov                 rax,regs_h                                                                                                                        ; Get the window height
                                              ;  mov                 qword ptr [rsp+20h],rax                                                                                                           ; Set nHeight
                                                 mov                 r9,regs_w                                                                                                                         ; Set nWidth
                                                 mov                 r8,regs_y                                                                                                                         ; Set y
                                                 mov                 rdx,regs_x                                                                                                                        ; Set x
                                                 mov                 rcx,hwnd                                                                                                                          ; Set hWnd
                                                 WinCall             MoveWindow, rcx, rdx, r8, r9, regs_h, 1                                                                                              ; Execute call

                                                 ;컴컴�[Skip remainder of processes]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 jmp                 fwpr_last                                                                                                                         ; Skip remainder of processes

;郞袴� 3: watch 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁

                                                 ;컴컴�[Set new window position]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 align               dword                                                                                                                             ; Set dword alignment
fwpr_00400                                       label               near                                                                                                                              ; Declare near label
                                              ;  mov                 qword ptr [rsp+28h],1                                                                                                             ; Set bRedraw
                                              ;  mov                 rax,watch_h                                                                                                                       ; Get the window height
                                              ;  mov                 qword ptr [rsp+20h],rax                                                                                                           ; Set nHeight
                                                 mov                 r9,watch_w                                                                                                                        ; Set nWidth
                                                 mov                 r8,watch_y                                                                                                                        ; Set y
                                                 mov                 rdx,watch_x                                                                                                                       ; Set x
                                                 mov                 rcx,hwnd                                                                                                                          ; Set hWnd
                                                 WinCall             MoveWindow, rcx, rdx, r8, r9, watch_h, 1                                                                                          ; Execute call

                                                 ;컴컴�[Skip remainder of processes]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 jmp                 fwpr_last                                                                                                                         ; Skip remainder of processes

;郞袴� 4: source 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴拷
;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁

                                                 ;컴컴�[Set new window position]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 align               dword                                                                                                                             ; Set dword alignment
fwpr_00500                                       label               near                                                                                                                              ; Declare near labe
                                              ;  mov                 qword ptr [rsp+28h],1                                                                                                             ; Set bRedraw
                                              ;  mov                 rax,source_h                                                                                                                      ; Get the window height
                                              ;  mov                 qword ptr [rsp+20h],rax                                                                                                           ; Set nHeight
                                                 mov                 r9,source_w                                                                                                                       ; Set nWidth
                                                 mov                 r8,source_y                                                                                                                       ; Set y
                                                 mov                 rdx,source_x                                                                                                                      ; Set x
                                                 mov                 rcx,hwnd                                                                                                                          ; Set hWnd
                                                 WinCall             MoveWindow, rcx, rdx, r8, r9, source_h, 1                                                                                         ; Execute call

                                                 ;컴컴�[Process no훒rror exit]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

fwpr_last:                                       mov                 rax,1                                                                                                                             ; Set TRUE return to continue enumerations

;郞袴� Exit 袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
;突袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴槁

;컴컴�[Restore altered registers]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

                                                 Restore_Registers                                                                                                                                     ; Restore altered registers

;컴컴�[Return to caller]컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

                                                 ret                                                                                                                                                   ; Return to caller

FWDb_Proc                                        endp
