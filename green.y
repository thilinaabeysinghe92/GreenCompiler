%{
	#include <stdio.h>
	extern int yylex();
	extern int yylineno;	
%}

%union {
     char *str;
}

%token EQUAL MYFILE DATA GRAPH SVN OPEN_PARA CLOSE_PARA OPENTAG CLOSETAG QUATATION ENDSTATEMENT MYWORD DEGIT

%token<str> MYWORD
%token<int> DEGIT



%start green

%%

green	: 	MYFILE MYWORD EQUAL QUATATION MYWORD QUATATION	{	

			printf("read file %s and store in %s ", $2 , $5);
	
		}	
		;


%%

int main(void){
	return yyparse();
}
int yywrap(void)
{
	return 1;
}
int yyerror(char *msg){
	return fprintf(stderr, "Green Output %s Error  \n", msg);
}
