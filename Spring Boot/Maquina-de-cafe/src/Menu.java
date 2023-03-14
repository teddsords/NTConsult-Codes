import java.util.ArrayList;

public class Menu {
    
    private ArrayList <InfoMenu> produtos = new ArrayList<InfoMenu>();
    
    Menu(){
        this.produtos.add(InfoMenu.CAPPUCCINO);
        this.produtos.add(InfoMenu.VANILLA);
        this.produtos.add(InfoMenu.MOCACCINO);
        this.produtos.add(InfoMenu.CARIOCA);
        this.produtos.add(InfoMenu.CHOCOLATEQUENTE);       
    }

    public ArrayList<InfoMenu> getProdutos() {
        return produtos;
    }

    public void setProdutos(ArrayList<InfoMenu> produtos) {
        this.produtos = produtos;
    }

    public int getTamanho(){
        return this.produtos.size();
    }
}
