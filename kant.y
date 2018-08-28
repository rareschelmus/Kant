%{
#include <stdio.h>
extern FILE* yyin;
extern char* yytext;
extern int yylineno;
%}
%token ID TIP INCEPUT SFARSIT ASSIGNARE NUMAR TXT PRINT READ
%start program
%%
program: "Programus Rex" bloc {printf("program corect sintactic\n");}
     ;

/* bloc */
bloc : INCEPUT list SFARSIT  
     ;
     
	 
	 
/* lista instructiuni */
list : declaratii
	 | list declaratii
     | statement ';' 
     | list statement ';'
	 | IF  '(' conditie ')' statement ';'
	 ;

	 
declaratii :  declaratie ';'
	   | declaratii declaratie ';'
	   ;
	   
declaratie : TIP ID 
           ;
		   
/* instructiune */
statement: ID ASSIGNARE expr  		 
         | ID '(' lista_apel ')'
		 | READ ID
		 | READ '(' lista_id ')'
		 | PRINT '(' words ')'
         ;
words: TXT
	 | exprs
     ;
		 
expr: expr '+' expr 
    | expr '-' expr 
    | expr '*' expr 
    | expr '/' expr
    | ID 
    | NUMAR
	; 	

conditie: expr
		| conditie '<' conditie
		| conditie '>' conditie
		| conditie '==' conditie
		| conditie '!=' conditie
		| conditie "SI" conditie
		| conditie "SAU" conditie
		
	
lista_apel : NUMAR
           | lista_apel ',' NUMAR
           ;

lista_id : ID 
          | lista_id ',' ID 
%%
int yyerror(char * s){
printf("eroare: %s la linia:%d\n",s,yylineno);
}

int main(int argc, char** argv){
yyin=fopen(argv[1],"r");
yyparse();
} 