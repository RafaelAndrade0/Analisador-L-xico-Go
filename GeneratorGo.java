/* Essa clase apenas gera a classe LexicalAnalyzer. O proprio Analisador Léxico */

package analisador.lexico.go;

import java.io.File;

public class GeneratorGo {
	public static void main(String[] args) {
		
		// todo: Tornar o path dinamico
		String path = "/home/rafael/eclipse-workspace/AnalisadorLexico/src/analisador/lexico/go/go.lex";
		
		File source = new File(path);
		
		// Comando para gerar a classe java.
		jflex.Main.generate(source);
		
	}

}
