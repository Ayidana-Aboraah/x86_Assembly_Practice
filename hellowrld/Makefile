all:
	nasm -f elf hello.asm
	ld -m elf_i386 hello.o -o hello
	./hello

cli:
	nasm -f elf cli.asm
	ld -m elf_i386 cli.o -o cli
