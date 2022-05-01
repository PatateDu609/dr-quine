CC		:=	gcc
CFLAGS	:=	-Wall -Werror -Wextra
LDFLAGS	:=

RM		:=	rm -f

%.o	:		%.c
			$(CC) $(CFLAGS) -c $< -o $@

all:		Colleen Grace Sully

Colleen:	Colleen.o
		$(CC) $(LDFLAGS) -o Colleen Colleen.o

Grace:		Grace.o
		$(CC) $(LDFLAGS) -o Grace Grace.o

Sully:		Sully.o
		$(CC) $(LDFLAGS) -o Sully Sully.o

re:			fclean all

clean:
		$(RM) *.o

fclean:		clean
		$(RM) Colleen Grace Sully Sully_*

.PHONY:		all clean fclean re
