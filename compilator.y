%{
    #include <stdio.h>
%}
%token ASSIGN EVAL 
%token OPPR CLPR COMMA DOT OPBR CLBR
%token INT FLOAT CHAR STRING BOOL VOID
%token IF FOR WHILE ELSE 
%token OR AND GREQ LESEQ EQ NOTEQ GR LES
%token NUM VAR
%token PLUS MINUS MULT DIV MOD

%start progr

%%
progr: block declarations {printf("Program corect sintactic!\n");}
     ;

declarations: declaration DOT
          | declarations COMMA declaration DOT
          ;

declaration: type var_list
          | type VAR OPPR param_list CLPR block
          | type VAR OPPR CLPR block
          ;

type: INT 
   | FLOAT 
   | BOOL 
   | CHAR 
   | STRING 
   | VOID 
   ;

param_list: param
               | param_list COMMA  param
               ;
            
param: type VAR
         ;

var_list: VAR
         | var_list COMMA VAR 
         ;

block: OPBR instr_list CLBR
    ;

instr_list: instruction DOT 
           | instr_list instruction DOT
           | if_instr 
           | while_instr
           | for_instr
           ;

if_instr: IF OPPR bool_expr CLPR block  
        | IF OPPR bool_expr CLPR block ELSE block
        ;
while_instr: WHILE OPPR bool_expr CLPR block  
        ;
for_instr: FOR OPPR VAR ASSIGN NUM COMMA bool_expr CLPR block  
        ;

bool_expr: OPPR bool_expr CLPR
         | instruction AND instruction
         | instruction OR instruction
         | instruction GREQ instruction
         | instruction GR instruction
         | instruction LESEQ instruction
         | instruction LES instruction
         | instruction NOTEQ instruction
         | instruction EQ instruction
         ;
instruction: VAR ASSIGN instruction
            | VAR 
            | NUM 
            | OPPR instruction CLPR
            | instruction PLUS instruction
            | instruction MINUS instruction
            | instruction MULT instruction
            | instruction DIV instruction
            | instruction MOD instruction
            ;
%%