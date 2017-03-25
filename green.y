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

%token EQUAL MYFILE DATA GRAPH SVN OPEN_PARA CLOSE_PARA OPENTAG CLOSETAG QUATATION ENDSTATEMENT MYWORD DEGIT Y FROM COLNAMES 
%token X SELECT PLOT BAR CHART ENDOFDOC
%token<str> MYWORD
%token<int> DEGIT



%start green

%%

green    :
		 | fileread dataX dataY end {

		 }
		 ;


fileread : MYFILE MYWORD EQUAL QUATATION MYWORD QUATATION	{	

			printf("read file %s and store in %s ", $2 , $5);
			char statement[1000] = "";
			strcat(statement, $2);
			strcat(statement, "=pd.read_csv(\"");
			strcat(statement, $5);
			strcat(statement, "\") \n");
			FILE *pythonFile;
			pythonFile = fopen("setup.py", "a");
			fputs("import pandas as pd \n", pythonFile);						
			fputs(statement, pythonFile);
			fclose(pythonFile);

			
		} 	
		;

dataX   : 	X EQUAL SELECT MYWORD FROM MYWORD {

			printf("x = %s [[ %s ]]\n",$6, $4);
			char statement[1000] = "";
			strcat(statement, "x = ");
			strcat(statement, $6);
			strcat(statement, "[[");
			strcat(statement, $4);
			strcat(statement, "]] \n");

			FILE *pythonFile;
			pythonFile = fopen("setup.py", "a");
			fputs(statement, pythonFile);
			fclose(pythonFile);


		} 
		;

dataY 	: 	Y EQUAL SELECT MYWORD FROM MYWORD {

			printf("y = %s [[ %s ]]\n",$6, $4);

			char statement[1000] = "";
			strcat(statement, "y =");
			strcat(statement, $6);
			strcat(statement, "[[");
			strcat(statement, $4);
			strcat(statement, "]] \n");

			FILE *pythonFile;
			pythonFile = fopen("setup.py", "a");
			fputs(statement, pythonFile);
			fclose(pythonFile);

		}
		;	

end 	: ENDOFDOC {
			printf("Compilation Finished \n ");
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
	return fprintf(stderr, "Green Output %s \n", msg);
}
