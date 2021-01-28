NAME	=	libasm.a

NASM	=	nasm

NASM_FLAGS	=	-f macho64

SRCDIR	=	srcs/

SRCS	=	$(addprefix ${SRCDIR}, \
			ft_strlen.s \
			ft_strcmp.s \
			ft_strcpy.s \
			ft_strdup.s \
			ft_write.s \
			ft_read.s)

OBJS	=	${SRCS:.s=.o}

PRINT	=	libftprintf.a

TEST	=	test

CC		=	gcc

CFLAGS		=	-Wall -Wextra -Werror

RM			=	rm -rf

.PHONY: all clean fclean test re

all: ${NAME}

${NAME}: ${OBJS}
	ar rc  ${NAME} ${OBJS}

${PRINT}:
	${MAKE} -C ./printf
	mv ./printf/${PRINT} ./

%.o: %.s
	@${NASM} ${NASM_FLAGS}  $< -o $@
	@echo "Object file successfuly compiled" 

test: all ${PRINT}
	${CC} ${CFLAGS}  ${PRINT} ${NAME} -o ${TEST} ${TEST}.c
	./${TEST} ${NAME}

clean:
	${RM} ${OBJS}
	${RM} ${TEST}
	${RM} ${PRINT}

fclean: clean
	${RM} ${NAME}

re: fclean all
