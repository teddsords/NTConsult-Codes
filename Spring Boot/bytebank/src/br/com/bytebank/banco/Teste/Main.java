package br.com.bytebank.banco.Teste;
import br.com.bytebank.banco.Modelo.ContaCorrente;
import br.com.bytebank.banco.Modelo.ContaPoupanca;

public class Main {
    public static void main(String[] args) {
       ContaCorrente cc = new ContaCorrente(111, 111);
       cc.deposita(100.0);

       ContaPoupanca cp = new ContaPoupanca(222, 222);
       cp.deposita(200);

       cc.transfere(10.0, cp);
       System.out.println("CC: " + cc.getSaldo());
       System.out.println("CP: " + cp.getSaldo());
    }
}