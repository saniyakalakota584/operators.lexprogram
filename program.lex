%{
#include<stdio.h>
%}

%%
"+"|"-"|"*"|"/"|"%"           {printf("%s is an arthimetic operator\n",yytext);}
"++"|"--"                     {printf("%s is an increment and decrement operator\n",yytext);}
"=="|"!="|"<="|">="|"<"|">"   {printf("%s is an relational operator\n",yytext);}
"&&"|"||"|"!"                 {printf("%s is an logical operator\n",yytext);}
"+="|"-="|"*="|"/="|"%="      {printf("%s is an assignment operator\n",yytext);}
"&"|"!"|"|"|"^"|"~"|">>"|"<<" {printf("%s is an bitwise operator\n",yytext);}
%%

int main()
{
yylex();
return 0;
}


##**✅ Explanation of Code**##
1. Header Section
%{
#include<stdio.h>
%}


This part is copied into the generated C file.

<stdio.h> is included so we can use printf().

2. Rules Section

Each rule is a regular expression pattern followed by an action in { }.

🔹 Arithmetic Operators
"+"|"-"|"*"|"/"|"%"   { printf("%s is an arithmetic operator\n", yytext); }


Matches: +, -, *, /, %.

These are the standard arithmetic operators in C.

🔹 Increment / Decrement Operators
"++"|"--"   { printf("%s is an increment and decrement operator\n", yytext); }


Matches: ++, --.

Used for increasing/decreasing variable values by 1.

🔹 Relational Operators
"=="|"!="|"<="|">="|"<"|">"   { printf("%s is a relational operator\n", yytext); }


Matches: ==, !=, <=, >=, <, >.

Used for comparisons (equal, not equal, greater than, etc.).

🔹 Logical Operators
"&&"|"||"|"!"   { printf("%s is a logical operator\n", yytext); }


Matches: &&, ||, !.

Used in Boolean logic (AND, OR, NOT).

🔹 Assignment Operators
"+="|"-="|"*="|"/="|"%="   { printf("%s is an assignment operator\n", yytext); }


Matches: +=, -=, *=, /=, %=.

These combine assignment with arithmetic operations.

🔹 Bitwise Operators
"&"|"!"|"|"|"^"|"~"|">>"|"<<"   { printf("%s is a bitwise operator\n", yytext); }


Matches: &, |, ^, ~, >>, <<.

Used for bit-level operations (AND, OR, XOR, NOT, shifts).

⚠️ Note: ! is actually a logical NOT operator, not a bitwise one. So that line can be corrected by removing "!" from here.

3. C Code Section
int main()
{
    yylex();
    return 0;
}


yylex() runs the lexical analyzer.

Reads input and applies the matching rule.

Prints the type of operator.

✅ Example Execution
Input:
+
++
!=
&&
>>=
|

Output:
+ is an arithmetic operator
++ is an increment and decrement operator
!= is a relational operator
&& is a logical operator
>> is a bitwise operator
| is a bitwise operator

✅ Summary

Program classifies operators into six categories.

Uses yytext to print the operator matched.

Helps in building a lexer for a compiler to detect operators.

