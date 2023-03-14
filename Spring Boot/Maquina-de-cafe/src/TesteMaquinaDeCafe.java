import java.util.Scanner;
public class TesteMaquinaDeCafe {
    public static void main(String[] args) {
        
        MaquinaDeCafe maquina = new MaquinaDeCafe();
        Scanner scan = new Scanner(System.in);
        String codProdutoSelecionado;
        double pagamento;
        int opOut = 0;

        while(opOut!= -1){
        maquina.apresentaCardapio();

        System.out.print("Informe o codigo do produto desejado: ");
        codProdutoSelecionado = scan.nextLine();
        codProdutoSelecionado = codProdutoSelecionado.toUpperCase();

        System.out.print("Insira o seu pagamento: ");
        pagamento = Double.parseDouble(scan.nextLine());

        maquina.calculaTroco(codProdutoSelecionado, pagamento);

        System.out.println("Deseja comprar mais produtos? Digite -1 para sair e 1 para continuar");
        opOut = Integer.parseInt(scan.nextLine());
        }
        scan.close();
    }
}
