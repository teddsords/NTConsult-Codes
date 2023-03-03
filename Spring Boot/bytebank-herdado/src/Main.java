public class Main {
    public static void main(String[] args) {

        Gerente g1 = new Gerente();

        g1.setNome("Marco");
        g1.setCpf("12345678900");
        g1.setSalario(5000.0);
        g1.setSenha(2222);

        SistemaInterno si = new SistemaInterno();
        si.autentica(g1);
    }
}