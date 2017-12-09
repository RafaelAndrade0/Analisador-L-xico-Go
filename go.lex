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

inteiro = 0|[1-9][0-9]*
brancos = [\n| |\t]

import = "import"
package = "package"

%%

{inteiro} { return createToken("inteiro", yytext()); }
{import} { return createToken(yytext(), "");}
{package} { return createToken(yytext(), "");}  
{brancos} { /**/ }

. { throw new RuntimeException("Caractere inválido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }