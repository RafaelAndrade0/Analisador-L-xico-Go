package analiseLexica;

import java_cup.runtime.*;

%%

%{


private GoToken createToken(String name, String value) {
    return new GoToken( name, value, yyline, yycolumn);
}

%}

%public
%class LexicalAnalyzer
%type GoToken
%line
%column

/* Pattern Definitions */


letter          = [A-Za-z]
digit           = [0-9]
alphanumeric    = {letter}|{digit}
other_id_char   = [_]
identifier      = {letter}({alphanumeric}|{other_id_char})*
integer         = {digit}*
real            = {integer}\.{integer}
char            = '.'
leftbrace       = \{
rightbrace      = \}
nonrightbrace   = [^}]
comment_body    = {nonrightbrace}*
comment         = {leftbrace}{comment_body}{rightbrace}
whitespace      = [ \n\t]


import = "import"
package = "package"
if = "if"
main = "main"


%%

/* Palavras Reservadas pela linguagem */

{if} { return createToken(yytext(), "Reserved Word");}
{main} { return createToken(yytext(), "Reserved Word");}
{package} { return createToken(yytext(), "Reserved Word");}
{import} { return createToken(yytext(), "Reserved Word");}


";" {return createToken("SEMICOLON", "");}
"." {return createToken("POINT", "");}
"(" {return createToken("Left Parentheses", "");}
")" {return createToken("Right Parentheses", "");}
">" {return createToken("GTH", "");}
"<" {return createToken("LTH", "");}
"+" {return createToken("PLUS", "");}
"/" {return createToken("DIV", "");}
"=" {return createToken("EQUAL", "");}
":=" {return createToken("ASSIGN", "");}
"," {return createToken("COMMA", "");}
"*" {return createToken("MUL", "");}
"<>" {return createToken("NEQ", "");}
"^" {return createToken("PTR", "");}
">" {return createToken("GTH", "");}
"-" {return createToken("MINUS", "");}
"[" {return createToken("LBRACKET", "");}
"]" {return createToken("RBRACKET", "");}
":" {return createToken("COLLON", "");}
"!=" {return createToken("DIFFE", "");}





{integer} { return createToken("inteiro", yytext()); }
{identifier} { return createToken(yytext(), "identifier"); } 
{leftbrace} {  return createToken(yytext(), ""); }
{rightbrace} {  return createToken(yytext(), ""); }
{whitespace} { /**/ }

. { throw new RuntimeException("Caractere inválido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }