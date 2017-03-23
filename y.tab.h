#define EQUAL 257
#define MYFILE 258
#define DATA 259
#define GRAPH 260
#define SVN 261
#define OPEN_PARA 262
#define CLOSE_PARA 263
#define OPENTAG 264
#define CLOSETAG 265
#define QUATATION 266
#define ENDSTATEMENT 267
#define MYWORD 268
#define DEGIT 269
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union {
     char *str;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;
