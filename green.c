#include <stdio.h>
#include "green.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char *tokens[] = {NULL, "myfile", "data", "graph", "svn"};

int main(void)
{
	int tokenname;
	int tokenvalue;

	tokenname = yylex();
	while(tokenname)
	{
		if(tokenname != OPENTAG && yylineno < 2)
		{
			printf("Syntax error in line %d : expect @start found %s \n ", yylineno, yytext);
			return 1;
		}

		tokenname = yylex();

	}

}
