%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
"zal"|"real"|"symb"|"lexikon" {return TIP;}
"alfa" {return INCEPUT;}
"omega" {return SFARSIT;}
#[_a-zA-Z][_a-zA-Z0-9]* {return ID;}
"=" {return ASSIGNARE;}
"read~" {return READ;}
"print" {return PRINT;}
"daca" {return IF;}
[0-9]+ {return NUMAR;}
 \" [^\"]* \" {return TXT;}
[ \t] ;
\n {yylineno++;}
. {return yytext[0];}

 