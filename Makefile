NAME = jeumult

SRC	= mult.c

OBJ	= $(SRC:.c=.o)

CC	= gcc

CFLAGS	= -Wall -Wextra -Werror -pedantic
CDEBUG	= -O2 -g -ggdb

RM	= rm -f
ECHO	= echo -e

all	: $(NAME)

$(NAME)	: $(OBJ)
	@$(CC) $(INC) $(CFLAGS) -o $(NAME) $(OBJ) $(LIB)
	@$(ECHO) '\033[0;32m> Compiled\033[0m'

clean	:
	-@$(RM) $(OBJ)
	-@$(RM) *~
	-@$(RM) \#*#
	@$(ECHO) '\033[0;31m> Directory cleaned\033[0m'


fclean	: clean
	-@$(RM) $(NAME)
	@$(ECHO) '\033[0;31m> Remove executable\033[0m'

re	: fclean all

.PHONY	: all clean fclean re

debug	: $(OBJ)
	@$(CC) $(INC) $(CDEBUG) -o $(NAME) $(OBJ) $(LIB)
	@$(ECHO) '\033[0;33m> Mode Debug: done\033[0m'
