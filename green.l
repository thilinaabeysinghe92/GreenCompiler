%{
#include "green.h"	
%}

%option nounput yylineno

%%
"="	return EQUAL;
"file"	return MYFILE;
"data"	return DATA;
"graph"	return GRAPH;
"svn"	return SVN;
"("	return OPEN_PARA;
")"	return CLOSE_PARA;
"@start" return OPENTAG;
"@end"	 return CLOSETAG;
"\""	return QUATATION;
";"	return ENDSTATEMENT;


[a-zA-Z][_a-zA-Z0-9]* return WORD;
[1-9][0-9]*	return DEGIT;
[ \t\n ]	;
.		printf("Unrecognized Character %s \n ", yytext);

%%
int yywrap(void)
{
	return 1;
}


