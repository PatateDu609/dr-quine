CC			:=	nasm
LD			:=	gcc
ASMFLAGS	:= -felf64 -g3 -Fdwarf
LDFLAGS		:= -no-pie -lc

RM			:=	rm -f

%.o	:		%.s
			$(CC) $(ASMFLAGS) $< -o $@

all:		Colleen Grace #Sully

Colleen:	Colleen.o
		$(LD) -o Colleen Colleen.o $(LDFLAGS)

Grace:		Grace.o
		$(LD) -o Grace Grace.o $(LDFLAGS)

Sully:		Sully.o
		$(LD) -o Sully Sully.o $(LDFLAGS)

re:			fclean all

clean:
		$(RM) *.o

fclean:		clean
		$(RM) Colleen Grace Sully Sully_*

.PHONY:		all clean fclean re
