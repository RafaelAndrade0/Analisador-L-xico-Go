package analisador.lexico.go;

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

/* Lexical Rules */

%%

"("  { return createToken("LEFT_Parentheses", yytext()); }
")"  { return createToken("RIGHT_Parentheses", yytext()); }
{integer} { return createToken("inteiro", yytext()); }
{import} { return createToken(yytext(), "");}
{if} { return createToken(yytext(), "Reserved Word");}
{main} { return createToken(yytext(), "Reserved Word");}
{package} { return createToken(yytext(), "Reserved Word");}
{identifier} { return createToken(yytext(), "identifier"); } 
{leftbrace} {  return createToken(yytext(), ""); }
{rightbrace} {  return createToken(yytext(), ""); }
{whitespace} { /**/ }

. { throw new RuntimeException("Caractere inválido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }