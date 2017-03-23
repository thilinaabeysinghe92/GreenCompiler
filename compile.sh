lex green.l
yacc -d green.y
gcc lex.yy.c y.tab.c -o GreenSystem

