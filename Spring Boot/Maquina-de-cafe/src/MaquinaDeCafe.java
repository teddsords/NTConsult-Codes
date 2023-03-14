public class MaquinaDeCafe {
    Menu cardapio = new Menu();

    public void apresentaCardapio(){
        for(int i = 0; i < cardapio.getTamanho(); i++){
            System.out.print("Produto: " + cardapio.getProdutos().get(i).getNome() + "\t" );
            System.out.print("Codigo: " + cardapio.getProdutos().get(i).getCodigo() + "\t" );
            System.out.println("Valor: " + cardapio.getProdutos().get(i).getValor());
            
        }
    }

    public void calculaTroco(String codProduto, double valorPago){
        double preco;
        int index = -1;
        
        for (int i = 0; i < cardapio.getTamanho(); i++) {
            if(cardapio.getProdutos().get(i).getCodigo().equals(codProduto)){
                index = i;
                break;
            }
        }

        preco = cardapio.getProdutos().get(index).getValor();

        if(valorPago < preco){
            System.out.println("Valor inserido é menor que o preço do produto. Insira mais notas.");
        }
        else if(valorPago == preco){
            System.out.println("Sem troco");
        }
        else{
           double troco = valorPago - preco;
           int valorIntegral = (int) troco;
           int trocoFracao = (int) Math.round((troco - valorIntegral) * 100);

           int notasCinco = valorIntegral / 5;
           int sobraCinco = valorIntegral % 5;
           int notasDois = sobraCinco / 2;
           int sobraDois = sobraCinco % 2;
           int notasUm = sobraDois;

           int moedasCinquenta = trocoFracao / 50;
           int sobraMoedaCinquenta = trocoFracao % 50;
           int moedasVinteCinco = sobraMoedaCinquenta / 25;
           int sobraMoedaVinteCinco = sobraMoedaCinquenta % 25;
           int moedasDez = sobraMoedaVinteCinco / 10;
           int sobraMoedasDez = sobraMoedaVinteCinco % 10;
           int moedasCinco = sobraMoedasDez;


           System.out.println("Quantidade de notas 5: " + notasCinco);
           System.out.println("Quantidade de notas 2: " + notasDois);
           System.out.println("Quantidade de notas 1: " + notasUm);

           System.out.println("Quantidade de moedas 50: " + moedasCinquenta);
           System.out.println("Quantidade de moedas 25: " + moedasVinteCinco);
           System.out.println("Quantidade de moedas 10: " + moedasDez);
           System.out.println("Quantidade de moedas 5: " + moedasCinco);
        }
            
    }
    
}

