/* Essa clase  executa a Analise Léxica */


package analisador.lexico.go;

import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Paths;

public class GoLexicalAnalyzer {
	
	public static void main(String[] args) throws IOException {
		
		String rootPath = Paths.get("").toAbsolutePath(). toString();
		String subPath = "\\src\\analisador\\lexico\\go\\";
		
		String path = rootPath + subPath + "helloWorld.go";
		
		LexicalAnalyzer lexical = new LexicalAnalyzer(new FileReader(path));
		
		GoToken token;
		
		while ((token = lexical.yylex()) != null) {
            System.out.println("<" + token.name + ",, " + token.value + "> (" + token.line + " - " 
            		+ token.column + ")");
        }
	}

}
