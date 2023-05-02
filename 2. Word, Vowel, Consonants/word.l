%{
#include<stdio.h>
#include<string.h>
int i = 0;
%}

%%
([a-zA-Z0-9])* {i++;}
"\n" {printf("Number of words: %d\n", i); i = 0;}
%%

int yywrap(){return 1;}

int main()
{
printf("Enter a string:");
yylex();
return 0;
}
