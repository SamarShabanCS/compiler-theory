%option noyywrap
%{
/* need this for the call to atof() below */
#include <math.h>
%}
     
DIGIT    [0-9]
ID       [a-z][a-z0-9]*
     
%%    
{DIGIT}+    {fprintf(yyout,"<integer,%s>", yytext);}    
{DIGIT}+"."{DIGIT}*  {fprintf(yyout,"<float,%s>", yytext);}
if|then|begin|end|procedure|function  {fprintf(yyout,"<keyword,%s>", yytext );}
{ID}   fprintf(yyout,"<identifier,%s>", yytext );
"+"|"-"|"*"|"/"   fprintf(yyout,"<operator,%s>", yytext );
"{"[\^{}}\n]*"}"     {}/* eat up one-line comments */
[ \t\n]+          {}/* eat up whitespace */
.           {}   
%%
     
int main()
{
  yyin = fopen( "in.txt", "r" );
  yyout = fopen( "out.txt", "w" );
  while (yylex()>0){}
  fclose(yyin);
  fclose(yyout);
}