local: timer.pp
	fpc timer.pp

all: local go32v2

go32v2: timer.pp
	fpc -Pi386 -Tgo32v2 timer.pp

