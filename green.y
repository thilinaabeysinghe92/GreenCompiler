%{
	#include <stdio.h>
	#include <stdlib.h>

	extern int yylex();
	extern int yylineno;
	extern char* yytext;

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


			char statement[1000] = "";

			strcat(statement, $2);
			strcat(statement, "=pd.read_csv(\"");
			strcat(statement, $5);
			strcat(statement, "\")");


			printf("%s\n", statement);
			FILE *pythonFile;
			pythonFile = fopen("setup.py", "w+");
			fputs("import pandas as pd \n", pythonFile);
			fputs(statement, pythonFile);
			fclose(pythonFile);

			
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
