%option noyywrap
%{
int num_lines = 1, num_chars = 0;
%} 
%%
[a-zA-Z]       ++num_chars;
\n          ++num_chars;  num_lines++;

%%
     
int main()
{
  yyin = fopen( "in.txt", "r" );
  yyout = fopen( "out.txt", "w" );
  while (yylex()>0){}
  fprintf( yyout,"\r# of lines = %d, # of chars = %d\n",
    num_lines, num_chars );
  fclose(yyin);
  fclose(yyout);
}

