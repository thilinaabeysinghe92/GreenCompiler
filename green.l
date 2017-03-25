%{
#include "y.tab.h"
extern int yyval;

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
"x" return X;
"select" return SELECT;
"colnames"	return COLNAMES;
"from" return FROM;
"y" return Y;
"plot" return PLOT;
"bar" return BAR;
"chart"	return CHART;
"<eof>"	return ENDOFDOC;





[a-zA-Z][_a-zA-Z0-9]* {yylval.str = strdup(yytext); return MYWORD;}
[1-9][0-9]*	{yyval = atoi(yytext); return DEGIT; };
[ \t ]	;
[ \n ]  ;
.		printf("Unrecognized Character %s \n ", yytext);

%%



