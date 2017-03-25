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
#define Y 270
#define FROM 271
#define COLNAMES 272
#define X 273
#define SELECT 274
#define PLOT 275
#define BAR 276
#define CHART 277
#define ENDOFDOC 278
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
