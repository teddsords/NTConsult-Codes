public class TesteReferencia {
    public static void main(String[] args) {
        Gerente g = new Gerente();
        g.setNome("Marcos");
        g.setSalario(5000.0);

        Funcionario f = new Funcionario();
        f.setSalario(2500.0);

        ControleBonificacao controle = new ControleBonificacao();
        controle.registra(g);
        controle.registra(f);

        System.out.println(controle.getSoma());
    }
}
