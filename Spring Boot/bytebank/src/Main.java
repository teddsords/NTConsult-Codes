public class Main {
    public static void main(String[] args) {
       Cliente paulo = new Cliente();
       paulo.setNome("Paulo Silveira");

       Conta contaDoPaulo = new Conta(895, 3456);
       contaDoPaulo.deposita(100);

       contaDoPaulo.setTitular(paulo);

        System.out.println(contaDoPaulo.getTitular().getNome());
        contaDoPaulo.getTitular().setProfissao("Programador");
    }
}