SECTION .data
msg db 'Hello World', 0Ah

SECTION .text
global _start

_start:
  ; now let's calculate our length before we send off the string
  mov ebx, msg
  call strlen

  mov ecx, msg ; move the memory address of our message string into ecx
  mov ebx, 1   ; write to the STDOUT file
  mov eax, 4   ; invoke SYS_WRITE (kernel opcode 4)
  int 80h      ; interrupt
  mov ebx, 0   ; no errors
  mov eax, 1   ; exit
  int 80h      ; interrupt and do the thing

strlen:
  push ebx
  mov edx, ebx ; edx will be the register we store our return value in

loop:
  cmp byte[edx], 0  ; check edx for string delimiter
  jz finished       ; jump to finished if zero-flag has been triggered
  inc edx           ; increment edx aka continue moving down the string
  jmp loop          ; back to the beginning of the loop

finished:
  sub edx, ebx ; subtract the beginning address from our end address to get our length
  pop ebx
  ret
