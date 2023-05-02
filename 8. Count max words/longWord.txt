%{
#include <stdio.h>
#include <string.h>
int longest_word_length = 0;
int frequency = 0;
char given_word[100];
%}

%%

[a-zA-Z]+   {
                if (strlen(yytext) > longest_word_length) {
                    longest_word_length = strlen(yytext);
                }
                if (strcmp(yytext, given_word) == 0) {
                    frequency++;
                }
            }
.|\n        {}

%%

int yywrap() {
    return 1;
}

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: %s filename\n", argv[0]);
        return 1;
    }
    printf("Enter the word you want to count the frequency of: ");
    scanf("%s", given_word);
    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        printf("Could not open file %s\n", argv[1]);
        return 1;
    }
    yylex();
    printf("Frequency of %s: %d\n", given_word, frequency);
    printf("Length of longest word: %d\n", longest_word_length);
    fclose(yyin);
    return 0;
}
