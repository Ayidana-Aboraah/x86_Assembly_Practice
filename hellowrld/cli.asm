%include 'funcs.asm'

SECTION .data

SECTION .text
global _start

_start:
  pop eax ; get the nubmer of arguments

nextArg:
  cmp eax, 0h
  jz doneParsing
  pop ecx
  call sprintLF
  dec eax
  jmp nextArg

doneParsing:
  call exit 
