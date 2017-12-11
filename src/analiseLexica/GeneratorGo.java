/* Essa clase apenas gera a classe LexicalAnalyzer. O proprio Analisador Léxico */

package analiseLexica;

import java.io.File;
import java.nio.file.Paths;

public class GeneratorGo {
	public static void main(String[] args) {
		
		String rootPath = Paths.get("").toAbsolutePath(). toString();
		String subPath = "\\src\\analiseLexica\\";
		
		String path = rootPath + subPath + "go.lex";
		
		File source = new File(path);
		
		// Comando para gerar a classe java.
		jflex.Main.generate(source); 
		
	}

}
