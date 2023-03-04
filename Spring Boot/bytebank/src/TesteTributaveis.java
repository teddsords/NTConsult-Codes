public class TesteTributaveis {
    public static void main(String[] args) {
        
        ContaCorrente cc = new ContaCorrente(222, 333);
        cc.deposita(100);

        SeguroDeVida seguro = new SeguroDeVida();

        CalculadorImposto calc = new CalculadorImposto();
        calc.registra(seguro);
        calc.registra(cc);

        System.out.println(calc.getTotalImposto());
    }
}
