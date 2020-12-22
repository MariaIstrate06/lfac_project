/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ASSIGN = 258,
    EVAL = 259,
    OPPR = 260,
    CLPR = 261,
    COMMA = 262,
    DOT = 263,
    OPBR = 264,
    CLBR = 265,
    INT = 266,
    FLOAT = 267,
    CHAR = 268,
    STRING = 269,
    BOOL = 270,
    VOID = 271,
    IF = 272,
    FOR = 273,
    WHILE = 274,
    ELSE = 275,
    OR = 276,
    AND = 277,
    GREQ = 278,
    LESEQ = 279,
    EQ = 280,
    NOTEQ = 281,
    GR = 282,
    LES = 283,
    NUM = 284,
    VAR = 285,
    PLUS = 286,
    MINUS = 287,
    MULT = 288,
    DIV = 289,
    MOD = 290
  };
#endif
/* Tokens.  */
#define ASSIGN 258
#define EVAL 259
#define OPPR 260
#define CLPR 261
#define COMMA 262
#define DOT 263
#define OPBR 264
#define CLBR 265
#define INT 266
#define FLOAT 267
#define CHAR 268
#define STRING 269
#define BOOL 270
#define VOID 271
#define IF 272
#define FOR 273
#define WHILE 274
#define ELSE 275
#define OR 276
#define AND 277
#define GREQ 278
#define LESEQ 279
#define EQ 280
#define NOTEQ 281
#define GR 282
#define LES 283
#define NUM 284
#define VAR 285
#define PLUS 286
#define MINUS 287
#define MULT 288
#define DIV 289
#define MOD 290

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
