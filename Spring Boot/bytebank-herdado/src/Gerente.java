public class Gerente extends Funcionario{
    private int senha;

    public boolean autentica(int senha){
        return this.senha == senha;
    }

    public int getSenha() {
        return senha;
    }

    public void setSenha(int senha) {
        this.senha = senha;
    }

    public double getBonificacao(){
        System.out.println("Chamando metodo de boni do Gerente");
        return super.getSalario();
    }
}
