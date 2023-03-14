public enum InfoMenu {
    
    CAPPUCCINO("Cappuccino", 4.5, "A50"), 
    VANILLA("Vanilla", 5.0, "B40"), 
    MOCACCINO("Mocaccino", 3.75, "A60"),
    CARIOCA("Carioca", 2.2, "M20"),
    CHOCOLATEQUENTE("Chocolate Quente", 8.4, "C10");
    
    private String nome;
    private double valor;
    private String codigo;

    InfoMenu(String nome, double valor, String codigo){
        this.nome = nome;
        this.valor = valor;
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public double getValor() {
        return valor;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }


    public String getCodigo() {
        return codigo;
    }  
}
