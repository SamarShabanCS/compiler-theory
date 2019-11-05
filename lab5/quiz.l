%option noyywrap
%{
%}

%%

b*a?|(ab)*a+  {fprintf(yyout,"<%s >", yytext);} 

%%
     
int main()
{
  yyin = fopen( "in.txt", "r" );
  yyout = fopen( "out.txt", "w" );
  while (yylex()>0){}
  fclose(yyin);
  fclose(yyout);
}