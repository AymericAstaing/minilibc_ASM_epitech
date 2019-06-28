##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## Desc
##

CC	=	ld

RM	=	rm -f

SHAREFLAG = -shared

CFLAGS	+=	-Wall -Wextra -Werror

NAME	=	libasm.so

SRCS	=	src/strlen.asm		\
			src/strcmp.asm		\
			src/strncmp.asm		\
			src/rindex.asm		\
			src/strstr.asm		\
			src/memcpy.asm		\
			src/memset.asm		\
			src/strpbrk.asm		\
			src/strcspn.asm		\
			src/strchr.asm

OBJS	=	$(SRCS:.asm=.o)

all:	$(NAME)

%.o: %.asm
	nasm -f elf64 -g $< -o $@

$(NAME): $(OBJS)
	$(CC) -fPIC $(SHAREFLAG) -o $(NAME)  $(OBJS)

clean:
		$(RM) ./src/*.o

fclean:	clean
		$(RM) $(NAME)

re:		fclean all

.PHONY:		all clean fclean re
