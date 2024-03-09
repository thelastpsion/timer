local: timer.pp
	fpc timer.pp

all: local go32v2 msdos

go32v2: timer.pp
	fpc -Pi386 -Tgo32v2 -otimer32.exe timer.pp

msdos: timer.pp
	fpc -Pi8086 -Tmsdos -otimer16.exe timer.pp
