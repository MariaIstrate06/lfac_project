%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern FILE* yyin;
extern char* yytext;
extern int yylineno;
int este_declarata(char a[]);
int este_deja_declarata (char numevar[], int tipvar);
int convassign(int a, int b); 
int convmess(int a, int b);
//aici modif!!!!!!!!! ^^
struct {
    char nume[100];
    int tip;
}variabile[100];
int nrvar = 0,nrtip;
char aux[100];

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
progr: declaratii bloc {printf("Program corect sintactic!\n");}
     ;

declaratii: declaratie DOT
          | declaratii COMMA declaratie DOT
          ;

declaratie: tip lista_var
          | tip VAR OPPR lista_parametri CLPR bloc 
          | tip VAR OPPR CLPR bloc 
          ;

tip: INT {$$=1; nrtip=1;}
   | FLOAT {$$=2; nrtip=2;}
   | BOOL {$$=5; nrtip=5;}
   | CHAR {$$=3; nrtip=3;}
   | STRING {$$=4; nrtip=4;}
   | VOID {$$=0;nrtip=0;}
   ;

lista_parametri: parametru
               | lista_parametri COMMA  parametru
               ;
            
parametru: tip VAR
         ;

lista_var: VAR
         | lista_var COMMA VAR 
         ;

bloc: OPBR lista_instr CLBR
    ;

lista_instr: instructiune DOT 
           | lista_instr instructiune DOT
           | if_instr 
           | while_instr
           | for_instr
           ;

if_instr: IF OPPR bool_expr CLPR bloc  
        | IF OPPR bool_expr CLPR bloc ELSE bloc 
        ;
while_instr: WHILE OPPR bool_expr CLPR bloc   
        ;
for_instr: FOR OPPR VAR ASSIGN NUM COMMA bool_expr CLPR bloc  
        ;

bool_expr: OPPR bool_expr CLPR
         | instructiune AND instructiune
         | instructiune OR instructiune
         | instructiune GREQ instructiune
         | instructiune GR instructiune
         | instructiune LESEQ instructiune
         | instructiune LES instructiune
         | instructiune NOTEQ instructiune
         | instructiune EQ instructiune
         ;
instructiune: VAR ASSIGN instructiune
            | VAR 
            | NUM 
            | OPPR instructiune CLPR
            | instructiune PLUS instructiune
            | instructiune MINUS instructiune
            | instructiune MULT instructiune
            | instructiune DIV instructiune
            | instructiune MOD instructiune
            ;


%%
//aici modif!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
int este_declarat(char a[20]){
    int ok, tipDeReturnat;
    for(int i=0; i<nrvar;i++){
        if(!strcmp(variabile[i].nume, a)){
            ok=1;
            //found declaration
            tipDeReturnat=variabile[i].tip;
            break;
        }
    }
    if(ok==0){
        printf("Eroare! Variabila %s nu a fost declarata!",a);
    }
    return tipDeReturnat;
}
//aici modif!!!!!!!!!!!!!!!!!!!
int este_deja_declarata (char numevar[], int tipvar)
{
    int i;
    for(i=0; i<nrvar; i++)
        if(strcmp(variabile[i].nume, numevar)==0) {
                printf("Variabila a fost declarata deja!");
                break;
            }
        if(i==nrvar){
            strcpy(variabile[i].nume, numevar);
            variabile[i].tip=tipvar;
        }
        nrvar++;
        return tipvar;
}
int convmess(int a, int b){
    
}
int convassign(int a, int b){
    if(a==0||b==0)
        return 0; 
    else if((a==1&&b==2)||(a==2&&b==1))
        return 1;
    //float cu int = int ^^ 
    else if((a==1&&b==5)||(a==5&&b==1))
        return 1;
    //bool cu int = int ^^
    else if((a==1&&b==3)||(a==3&&b==1))
        return 1;
    //int cu char face int 
    else if((a==3&&b==4)||(a==4&&b==3))
        return 4;
    //bool int cu float face int 
    else if((a==3&&b==4)||(a==4&&b==3))
        return 4;
    //bool int cu float face int 
    else return 1;
}

int yyerror (char* s)
{
    printf("eroare: %s la linia %d\n",s,yylineno);
}
int main(int argc, char** argv)
{
    yyin=fopen(argv[1],"r");
    yyparse();
}