%include  'funcs.asm'

SECTION .data
msg db 'Hello World', 0Ah
msg2 db 'SUPPAAAA', 0Ah
msg3 db 'With or without', 0Ah

SECTION .text
global _start

_start:
  mov ecx, msg ; ebx will be used to arguments
  call sprint

  mov ecx, msg2
  call sprint

  mov ecx, msg3
  call sprint

  call exit
