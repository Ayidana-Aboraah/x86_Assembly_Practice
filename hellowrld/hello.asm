%include  'funcs.asm'

SECTION .data
msg db 'Hello World', 0h
msg2 db 'SUPPAAAA', 0h
msg3 db 'With or without', 0h

SECTION .text
global _start

_start:
  mov ecx, msg ; ebx will be used to arguments
  call sprintLF

  mov ecx, msg2
  call sprintLF

  mov ecx, msg3
  call sprintLF

  call exit
