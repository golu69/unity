%{
int flag = 0;
%}

%%
[a-z.0-9_]+@[a-z]+\.(com)$    flag = 1;
.|\n    /* ignore any other characters */
%%

int yywrap() {
    return 1; // indicate end of input
}

int main() {
    char email[100];
    printf("Enter an email address: ");
    fgets(email, 100, stdin); // read input from user
    yy_scan_string(email); // scan input string
    yylex(); // perform lexical analysis
    if (flag == 1)
        printf("Valid");
    else
        printf("Not Valid");
    return 0;
}
