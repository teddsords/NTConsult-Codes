public class Gerente extends Autenticavel{

    public double getBonificacao(){
        System.out.println("Chamando metodo de boni do Gerente");
        return super.getSalario();
    }
}
