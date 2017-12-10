package analisador.lexico.go;

public class GoToken {
	
	public String name;
    public String value;
    public Integer line;
    public Integer column;
    
    // Construtor
	public GoToken(String name, String value, Integer line, Integer column) {
		super();
		this.name = name;
		this.value = value;
		this.line = line;
		this.column = column;
	}
}
