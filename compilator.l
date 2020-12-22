%{
#include <stdio.h>
#include "y.tab.h"
%}

caracter [A-Za-z]
cifra [0-9]

%%

"int" {return INT;}
"float" {return FLOAT;}
"string" {return STRING;}
"char" {return CHAR;}
"bool" {return BOOL;}
"void" {return VOID;}
"=" {return ASSIGN;}
"if" {return IF;}
"else" {return ELSE;}
"for" {return FOR;}
"while" {return WHILE;}
"eval" {return EVAL;}
"||" {return OR;}
"&&" {return AND;}
">=" {return GREQ;}
"<=" {return LESEQ;}
"==" {return EQ;}
"!=" {return NOTEQ;}
">" {return GR;}
"<" {return LES;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MULT;}
"/" {return DIV;}
"%" {return MOD;}
"{" {return OPBR;}
"}" {return CLBR;}
"(" {return OPPR;}
")" {return CLPR;}
"." {return DOT;}
"," {return COMMA;}
{caracter}({caracter}|{cifra})* {return VAR;}
{cifra}+ {return NUM;}
[\t] ;
\n {yylineno++;}
