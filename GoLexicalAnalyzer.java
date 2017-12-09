/* Essa clase  executa a Analise Léxica */


package analisador.lexico.go;

import java.io.FileReader;
import java.io.IOException;

public class GoLexicalAnalyzer {
	
	public static void main(String[] args) throws IOException {
		
		// todo: Tornar o path dinamico
		String path = "/home/rafael/eclipse-workspace/AnalisadorLexico/src/analisador/lexico/go/helloWorld.go";
		
		LexicalAnalyzer lexical = new LexicalAnalyzer(new FileReader(path));
		
		GoToken token;
		
		while ((token = lexical.yylex()) != null) {
            System.out.println("<" + token.name + ", " + token.value + "> (" + token.line + " - " 
            		+ token.column + ")");
        }
	}

}
