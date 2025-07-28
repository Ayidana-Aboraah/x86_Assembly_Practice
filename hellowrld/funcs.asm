; edx(int) slen(args: ecx(string) )
slen: 
  mov edx, ecx ; edx will be the register we store our return value in

count:
  cmp byte[edx], 0  ; check edx for string delimiter
  jz leave       ; jump to finished if zero-flag has been triggered
  inc edx           ; increment edx aka continue moving down the string
  jmp count          ; back to the beginning of the loop

leave:
  sub edx, ecx ; subtract the beginning address from our end address to get our length
  ret

; void print( args:ecx(msg str), edx(length) )
print:
  push ebx
  push eax    ; since this function returns nothing, we push all the registers so that we can reset them once we return
  
  mov ebx, 1
  mov eax, 4
  int 80h

  pop eax
  pop ebx
  ret
  

; void sprint (args: ecx(msg))
sprint: 
  push edx
  push ebx
  push eax  ; since this function returns nothing, we push all the registers so that we can reset them once we return
  call slen ; returns in the edx register

  ; print the message
  ; ebx is for fd, ecx is for string, edx is for length
  ; mov ebx, 1
  ; mov eax, 4
  ; int 80h
  call print

  ; exit the function
  pop eax,
  pop ebx,
  pop edx,
  ret

; void exit()
exit:
  mov ebx, 0
  mov eax, 1
  int 80h
  ret
